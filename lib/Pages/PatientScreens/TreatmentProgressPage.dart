import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homephiys/Entity/Patient.dart';
import 'package:homephiys/Entity/Report.dart';
import 'package:homephiys/Helpers/LogicHelpers.dart';
import 'package:homephiys/Pages/PatientScreens/QuestionReportPage.dart';
import 'package:toast/toast.dart';

class TreatmentProgressPage extends StatefulWidget {
  final Widget child;
  final Patient patient;
  final int stageIndex;
  final bool animate;

  TreatmentProgressPage(
      {Key key, this.child, this.patient, this.stageIndex, this.animate})
      : super(key: key);

  _TreatmentProgressPage createState() => _TreatmentProgressPage();
}

class _TreatmentProgressPage extends State<TreatmentProgressPage> {
  List<charts.Series<exercises, String>> _seriesData;
  List<charts.Series<scoreExercise, int>> _seriesLineData;

  _generateData() {
    List<exercises> exerciseList = [];
    //get all reports of paitnet
    List<Color> colorsArray = [];

    //part 1
    List<Report> allReport = this.widget.patient.reportList;
    for (int i = 0;
        i <
            this
                .widget
                .patient
                .treatmentType
                .stageList[this.widget.stageIndex]
                .exerciseList
                .length;
        i++) {
      //random;
      colorsArray
          .add(Colors.primaries[Random().nextInt(Colors.primaries.length)]);
      //get all reports of specific exercise.
      List<Report> currentReports =
          LogicHelpers.getReprotOfCurrentExerciseAndStage(
              allReport, this.widget.stageIndex, i);

      String name = (this
                  .widget
                  .patient
                  .treatmentType
                  .stageList[this.widget.stageIndex]
                  .exerciseList[i]
                  .level +
              1)
          .toString();
      if (currentReports.isNotEmpty) {
        //get the high score from all the reports of specific exercie.
        int reportHighScore =
            LogicHelpers.getHigestScoreOfReport(currentReports);

        AddedExerciseToGraph(
            exerciseList, name, i, reportHighScore, colorsArray[i]);
      } else {
        AddedExerciseToGraph(exerciseList, name, i, 0, colorsArray[i]);
      }
    }

    //part 2
    List<List<scoreExercise>> scoreExerciseList = [];
    for (int i = 0;
        i <
            this
                .widget
                .patient
                .treatmentType
                .stageList[this.widget.stageIndex]
                .exerciseList
                .length;
        i++) {
      List<scoreExercise> subScoreExerciseList = [];
      List<Report> currentReports =
          LogicHelpers.getReprotOfCurrentExerciseAndStage(
              this.widget.patient.reportList, this.widget.stageIndex, i);
      Color color = colorsArray[i];
      for (int j = 0; j < currentReports.length; j++) {
        subScoreExerciseList.add(new scoreExercise(
            color, new scoreReport(j, currentReports[j].score)));
      }
      scoreExerciseList.add(subScoreExerciseList);
    }

    _seriesData.add(
      charts.Series(
        domainFn: (exercises exercise, _) => exercise.exName,
        measureFn: (exercises exercise, _) => exercise.percentage,
        data: exerciseList,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (exercises exercise, _) =>
            charts.ColorUtil.fromDartColor(exercise.color),
      ),
    );

    for (int i = 0;
        i <
            this
                .widget
                .patient
                .treatmentType
                .stageList[this.widget.stageIndex]
                .exerciseList
                .length;
        i++) {
      _seriesLineData.add(
        new charts.Series<scoreExercise, int>(
          id: 'Desktop',
          colorFn: (scoreExercise exercise, _) =>
              charts.ColorUtil.fromDartColor(exercise.color),
          domainFn: (scoreExercise exercise, _) => exercise.report.score,
          measureFn: (scoreExercise exericse, _) =>
              exericse.report.numberOfTimes,
          data: scoreExerciseList[i],
        ),
      );
    }
  }

  void AddedExerciseToGraph(List<exercises> exerciseList, String name, int i,
      int numberOfReportScore, Color color) {
    exerciseList.add(new exercises(
        name + " תרגיל",
        LogicHelpers.calculatePercentage(
            numberOfReportScore,
            this
                .widget
                .patient
                .treatmentType
                .stageList[this.widget.stageIndex]
                .exerciseList[i]
                .questions
                .length),
        color));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = [];
    _seriesLineData = [];

    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'התקדמות הטיפול',
              style: TextStyle(color: Colors.black),
            ),
            bottom: TabBar(
              //indicatorColor: Color(0xff9962D0),
              tabs: <Widget>[
                Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
                Tab(icon: Icon(FontAwesomeIcons.chartLine)),
                Tab(icon: Icon(FontAwesomeIcons.book)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'קצב ההתקדמות (באחוזים) ',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: charts.BarChart(_seriesData,
                              animate: true,
                              barGroupingType: charts.BarGroupingType.grouped,
                              //behaviors: [new charts.SeriesLegend()],
                              animationDuration: Duration(seconds: 5),
                              behaviors: [
                                new charts.ChartTitle(' % אחוזים',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                /*child: Container(
                  child: Center(
                    child: Column(
                     /* children: <Widget>[
                        Text(
                          'קצב התקדמות ביחס למספר התרגילים',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: charts.LineChart(_seriesLineData,
                              animate: true,
                              behaviors: [
                                new charts.ChartTitle(
                                  ' ניקוד ',
                                  behaviorPosition:
                                      charts.BehaviorPosition.start,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea,
                                ),
                                new charts.ChartTitle(
                                  ' מספר התרגילים שבוצעו  ',
                                  behaviorPosition:
                                      charts.BehaviorPosition.bottom,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea,
                                ),
                              ]),
                        ),
                      ],*/
                    ),
                  ),
                ),*/
              ),
              Column(children: <Widget>[
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: new Text(
                      'דוחות תרגילים',
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                Flexible(
                  flex: 10,
                  child: Container(
                    child: Center(
                      child: Column(
                        children: List.generate(
                            this
                                .widget
                                .patient
                                .treatmentType
                                .stageList[this.widget.stageIndex]
                                .exerciseList
                                .length, (index) {
                          if (this
                                  .widget
                                  .patient
                                  .accessesStageList[this.widget.stageIndex]
                                  .exerciseAccess[index] ==
                              true) {
                            return ExerciseButton(
                              patient: this.widget.patient,
                              exerciseIndex: this
                                  .widget
                                  .patient
                                  .treatmentType
                                  .stageList[this.widget.stageIndex]
                                  .exerciseList[index]
                                  .level,
                              stageIndex: this.widget.stageIndex,
                              color: Colors.blue,
                              enable: true,
                            );
                          } else {
                            return ExerciseButton(
                              patient: this.widget.patient,
                              exerciseIndex: this
                                  .widget
                                  .patient
                                  .treatmentType
                                  .stageList[this.widget.stageIndex]
                                  .exerciseList[index]
                                  .level,
                              stageIndex: this.widget.stageIndex,
                              color: Colors.grey,
                              enable: false,
                            );
                          }
                        }),
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        )
    );
  }
}

class ExerciseButton extends StatelessWidget {
  final Patient patient;
  final int stageIndex;
  final int exerciseIndex;
  final Color color;
  final bool enable;

  const ExerciseButton({
    Key key,
    this.patient,
    this.exerciseIndex,
    this.stageIndex,
    this.color,
    this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (this.enable) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuestionReportPage(
                              patient: this.patient,
                              stageIndex: this.stageIndex,
                              exercieIndex: this.exerciseIndex)));
                } else {
                  Toast.show("not have access yet", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                }
              },
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 400.0,
                    ),
                    Text(
                      "דוחות תרגיל:" + (exerciseIndex + 1).toString(),
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
                color: this.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class exercises {
  String exName;
  double percentage;
  Color color;

  exercises(this.exName, this.percentage, this.color);
}

class scoreExercise {
  Color color;
  scoreReport report;
  scoreExercise(this.color, this.report);
}

class scoreReport {
  int score;
  int numberOfTimes;
  scoreReport(this.score, this.numberOfTimes);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class ReusableCard extends StatefulWidget {
  final Widget cardChild;
  final Color color;

  ReusableCard({this.cardChild, this.color});

  _ReusableCard createState() => _ReusableCard();
}

class _ReusableCard extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.widget.cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: this.widget.color,
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
