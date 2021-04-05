import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Entity/Exercise.dart';
import 'package:homephiys/Entity/Paitent.dart';

import 'package:homephiys/Entity/Stage.dart';
import 'package:toast/toast.dart';
import 'ExercisePage.dart';

class StagePage extends StatefulWidget {
  final Paitent paitent;
  final int stageIndex;

  StagePage({this.paitent, this.stageIndex});

  _StagePage createState() => _StagePage();
}

class _StagePage extends State<StagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'home Exercise',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.lightBlue,
        body: Column(
          children: List.generate(
              this
                  .widget
                  .paitent
                  .getTreatmentType
                  .getStageList[this.widget.stageIndex]
                  .getExerciseList
                  .length, (index) {
            if (this
                    .widget
                    .paitent
                    .accessesStageList[this.widget.stageIndex]
                    .exerciseAccess[index] ==
                true) {
              return ExerciseButton(
                color: Colors.white,
                enable: true,
                paitent: this.widget.paitent,
                stageIndex: this.widget.stageIndex,
                exerciseIndex: index,
              );
            } else {
              return ExerciseButton(
                color: Colors.grey,
                enable: false,
                paitent: this.widget.paitent,
                stageIndex: this.widget.stageIndex,
                exerciseIndex: index,
              );
            }
          }),
        )
    );
  }
}

class ExerciseButton extends StatefulWidget {
  const ExerciseButton({
    Key key,
    this.enable,
    this.color,
    this.paitent,
    this.exerciseIndex,
    this.stageIndex,
  }) : super(key: key);

  final Color color;
  final bool enable;
  final Paitent paitent;
  final int exerciseIndex;
  final int stageIndex;
  _ExerciseButton createState() => _ExerciseButton();
}

class _ExerciseButton extends State<ExerciseButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (this.widget.enable) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExercisePage(
                                paitent: this.widget.paitent,
                                stageIndex: this.widget.stageIndex,
                                exerciseIndex: this.widget.exerciseIndex,
                              )));
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
                      "תרגיל :" + (this.widget.exerciseIndex + 1).toString(),
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
                color: this.widget.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
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
