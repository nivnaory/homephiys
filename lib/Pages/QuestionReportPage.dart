import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Entity/Exercise.dart';
import 'package:homephiys/Entity/Paitent.dart';

import 'package:homephiys/Entity/Stage.dart';
import 'package:toast/toast.dart';
import 'ExercisePage.dart';
import 'ReportPage.dart';

class QuestionReportPage extends StatefulWidget {




  _QuestionReportPage createState() => _QuestionReportPage();
}

class _QuestionReportPage extends State<QuestionReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Reports',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
              children:<Widget>[
                Flexible(
                    flex:0,
                    fit:FlexFit.tight,
                    child:new  Text(
                      'שאלונים קודמים',
                      style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                ),
                Flexible(
                  flex:2,
                  fit:FlexFit.tight,
                  child: Container(
                    child: Center(
                      child: Column(
                        children: List.generate(
                            5, (index) {
                          return ExerciseButton();
                        }
                        ),
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
  const ExerciseButton({
    Key key,
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
                        builder: (context) => ReportPage(
                        )));
              },
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 400.0,
                    ),
                    Text(
                      ":שאלון מספר ",
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
                color:Colors.blue,
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
