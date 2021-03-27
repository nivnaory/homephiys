import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Entity/Exercise.dart';

import 'package:homephiys/Entity/Stage.dart';
import 'package:toast/toast.dart';
import 'ExercisePage.dart';

class StagePage extends StatefulWidget {
  final Stage stage;
  final String username;
  final int currentScore;
  final List<bool> accessExerciseList;
  StagePage(
      {@required this.stage,
      this.username,
      this.currentScore,
      this.accessExerciseList});

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
          children:
              List.generate(this.widget.stage.getExerciseList.length, (index) {
            if (this.widget.accessExerciseList[index] == true) {
              return ExerciseButton(
                exercise: this.widget.stage.getExerciseList[index],
                username: this.widget.username,
                enable: this.widget.accessExerciseList[index],
                color: Colors.white,
              );
            } else {
              return ExerciseButton(
                exercise: this.widget.stage.getExerciseList[index],
                username: this.widget.username,
                enable: this.widget.accessExerciseList[index],
                color: Colors.grey,
              );
            }
          }),
        ));
  }
}

class ExerciseButton extends StatefulWidget {
  const ExerciseButton({
    Key key,
    @required this.username,
    this.exercise,
    this.enable,
    this.color,
  }) : super(key: key);

  final Exercise exercise;
  final String username;
  final Color color;
  final bool enable;
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
                              exercise: this.widget.exercise,
                              username: this.widget.username)));
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
                      "תרגיל :" + this.widget.exercise.getLevel.toString(),
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
