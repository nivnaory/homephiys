import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homephiys/Entity/Paitent.dart';
import 'package:homephiys/Entity/Report.dart';
import 'package:homephiys/Helpers/LogicHelpers.dart';
import 'package:homephiys/Pages/QuestionReportPage.dart';
import 'package:toast/toast.dart';

class TreatmentProgressPage extends StatefulWidget {
  final Widget child;
  final Paitent paitent;
  final int stageIndex;

  TreatmentProgressPage({Key key, this.child, this.paitent, this.stageIndex})
      : super(key: key);

  _TreatmentProgressPage createState() => _TreatmentProgressPage();
}

class _TreatmentProgressPage extends State<TreatmentProgressPage> {
  List<charts.Series<exercises, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Sales, int>> _seriesLineData;

  _generateData() {
    List<exercises> exerciseList=[];
    //get all reports of paitnet
    List<Report>allReport=this.widget.paitent.reportList;

    for (int i=0 ;i<this.widget.paitent.treatmentType.stageList[this.widget.stageIndex].exerciseList.length;i++){
      //get all reports of specific exercise.

      List<Report>currentReports=LogicHelpers.getReprotOfCurrentExerciseAndStage(allReport,this.widget.stageIndex,i);
      print(currentReports);
      String name = (this.widget.paitent.treatmentType
          .stageList[this.widget.stageIndex].exerciseList[i].level+1).toString();
      print("name" +name);
      if(currentReports.isNotEmpty) {
        //get the high score from all the reports of specific exercie.
        int reportHighScore = LogicHelpers.getHigestScoreOfReport(currentReports);
        AddedExerciseToGraph(exerciseList, name, i, reportHighScore);
      }else{
        AddedExerciseToGraph(exerciseList, name, i, 0);
      }
    }

    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];


      _seriesData.add(
        charts.Series(
          domainFn:(exercises exercise,_) =>exercise.exName,
          measureFn: (exercises exercise, _) => exercise.percentage,
          data: exerciseList,
          fillPatternFn: (_, __) => charts.FillPatternType.solid,
          fillColorFn: (exercises exercise, _) =>
              charts.ColorUtil.fromDartColor(Color(Random().nextInt(0xffffffff)).withAlpha(0xff)),
        ),
      );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  void AddedExerciseToGraph(List<exercises> exerciseList, String name, int i, int numberOfReportScore) {

     exerciseList.add(new exercises(name + " תרגיל",
        LogicHelpers.calculatePercentage(numberOfReportScore,
            this.widget.paitent.treatmentType
                .stageList[this.widget.stageIndex].
            exerciseList[i].questions.length)));
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
              'Treatment Progress',
              style: TextStyle(color: Colors.white),
            ),
            bottom: TabBar(
              //indicatorColor: Color(0xff9962D0),
              tabs: <Widget>[
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
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
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Sales for the first 5 years',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: charts.LineChart(_seriesLineData,
                              defaultRenderer: new charts.LineRendererConfig(
                                  includeArea: true, stacked: true),
                              animate: true,
                              animationDuration: Duration(seconds: 5),
                              behaviors: [
                                new charts.ChartTitle('Years',
                                    behaviorPosition:
                                        charts.BehaviorPosition.bottom,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle('Sales',
                                    behaviorPosition:
                                        charts.BehaviorPosition.start,
                                    titleOutsideJustification: charts
                                        .OutsideJustification.middleDrawArea),
                                new charts.ChartTitle(
                                  'Departments',
                                  behaviorPosition: charts.BehaviorPosition.end,
                                  titleOutsideJustification: charts
                                      .OutsideJustification.middleDrawArea,
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
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
                                .paitent
                                .treatmentType
                                .stageList[this.widget.stageIndex]
                                .exerciseList
                                .length, (index) {
                          if (this
                                  .widget
                                  .paitent
                                  .accessesStageList[this.widget.stageIndex]
                                  .exerciseAccess[index] ==
                              true) {
                            return ExerciseButton(
                                paitent: this.widget.paitent,
                                exerciseIndex: this
                                    .widget
                                    .paitent
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
                                paitent: this.widget.paitent,
                                exerciseIndex: this
                                    .widget
                                    .paitent
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
        ));
  }
}

class ExerciseButton extends StatelessWidget {
  final Paitent paitent;
  final int stageIndex;
  final int exerciseIndex;
  final Color color;
  final bool enable;

  const ExerciseButton({
    Key key,
    this.paitent,
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
                     builder: (context) =>
                         QuestionReportPage(
                             paitent: this.paitent,
                             stageIndex: this.stageIndex,
                             exercieIndex: this.exerciseIndex)));
           }else{
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

  exercises(this.exName, this.percentage);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
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

