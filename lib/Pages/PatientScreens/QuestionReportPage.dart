import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:homephiys/Entity/Patient.dart';
import 'package:homephiys/Entity/Report.dart';
import 'package:homephiys/Helpers/LogicHelpers.dart';

import 'ReportPage.dart';


class QuestionReportPage extends StatefulWidget {
  final Patient patient;
  final int stageIndex;
  final int exercieIndex;

  const QuestionReportPage(
      {Key key, this.patient, this.stageIndex, this.exercieIndex})
      : super(key: key);

  _QuestionReportPage createState() => _QuestionReportPage();
}

class _QuestionReportPage extends State<QuestionReportPage> {
  List<Report> reportList;

  @override
  void initState() {
    reportList = LogicHelpers.getReprotOfCurrentExerciseAndStage(
        this.widget.patient.reportList,
        this.widget.stageIndex,
        this.widget.exercieIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'שאלונים קודמים',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Flexible(
              flex: 0,
              fit: FlexFit.tight,
              child: new Text(
                'שאלונים קודמים',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Container(
              child: Center(
                child: Column(
                  children: List.generate(this.reportList.length, (index) {
                    return ExerciseButton(
                      patient: this.widget.patient,
                      reportIndex: index,
                      reprot: this.reportList[index],
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseButton extends StatelessWidget {
  final Patient patient;
  final int reportIndex;
  final Report reprot;
  const ExerciseButton({
    Key key,
    this.patient,
    this.reportIndex,
    this.reprot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReportPage(report: this.reprot)));
              },
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 400.0,
                    ),
                    Text(
                      "שאלון מספר " + (this.reportIndex + 1).toString(),
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Pollution {
  String place;
  int year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
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
