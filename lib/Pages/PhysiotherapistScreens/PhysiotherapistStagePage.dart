import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Entity/Exercise.dart';
import 'package:homephiys/Entity/Patient.dart';
import 'package:homephiys/Pages/PhysiotherapistScreens/PhysiotherapistWatchExercisePage.dart';

import 'package:toast/toast.dart';




class PhysiotherapistStagePage extends StatefulWidget {
  final Patient patient;
  final int stageIndex;

  PhysiotherapistStagePage({this.patient, this.stageIndex});

  _PhysiotherapistStagePage createState() => _PhysiotherapistStagePage();
}

class _PhysiotherapistStagePage extends State<PhysiotherapistStagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'רשימת התרגולים הביתיים',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.lightBlue,
        body: Column(
          children: List.generate(
              this
                  .widget
                  .patient
                  .treatmentType
                  .stageList[this.widget.stageIndex]
                  .exerciseList
                  .length, (index) {

              return ExerciseButton(
                color: Colors.white,
                enable: true,
                patient: this.widget.patient,
                stageIndex: this.widget.stageIndex,
                exerciseIndex:index
              );
          }),
        ));
    }
}

class ExerciseButton extends StatefulWidget {
  const ExerciseButton({
    Key key,
    this.enable,
    this.color,
    this.patient,
    this.stageIndex,
    this.exerciseIndex

  }) : super(key: key);

  final Color color;
  final bool enable;
  final Patient patient;
  final int stageIndex;
  final int exerciseIndex;
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhysiotherapistWatchExercisePage(patient:this.widget.patient,stageIndex:this.widget.stageIndex,exerciseIndex:this.widget.exerciseIndex,)));
              },
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 400.0,
                    ),
                    Text(
                      "תרגול מספר " + ((this.widget.exerciseIndex)+1).toString(),
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