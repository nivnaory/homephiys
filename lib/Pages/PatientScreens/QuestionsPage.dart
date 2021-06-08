import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:homephiys/Controller/AccessController.dart';
import 'package:homephiys/Controller/ReportController.dart';
import 'package:homephiys/Entity/Patient.dart';
import 'package:homephiys/Entity/Report.dart';
import 'package:homephiys/Helpers/LogicHelpers.dart';
import 'package:toast/toast.dart';

import 'ExercisePage.dart';
import 'MedicalInspectionStage.dart';
import 'StagePage.dart';

class QuestionsPage extends StatefulWidget {
  final int stageLevel;
  final int exerciseLevel;
  List<int> answers = [];
  final Patient patient;
   List<String> questions;

  final List<String> option_answers = [
    "במידה מועטה מאוד", //0
    "במידה מועטה", //1
    "מידה בינונית", //2
    " במידה רבה ", //3
    " במידה רבה מאוד ", //4
  ];

  QuestionsPage({
    this.stageLevel,
    this.exerciseLevel,
    this.patient})
     {
      this.questions= this.patient.treatmentType.stageList[this.stageLevel].exerciseList[this.exerciseLevel].questions;
     }

  @override
  _QuestionsPage createState() => _QuestionsPage();
}

class _QuestionsPage extends State<QuestionsPage> {
  TextEditingController textController = new TextEditingController();
  int threshold = 0;
  int numberOfExercises = 0;

  AccessController accessController = new AccessController();

  @override
  void initState() {
    threshold = ((this.widget.questions.length * 5) * 0.8).toInt();
    super.initState();

    numberOfExercises = this
            .widget
            .patient
            .treatmentType
            .stageList[this.widget.stageLevel]
            .exerciseList
            .length -
        1;
  }

  @override
  Widget build(BuildContext context) {
    this.widget.answers = List<int>.filled(this.widget.questions.length, 0);
    return Scaffold(
      appBar: AppBar(
        title: Text("שאלון עבור תרגיל מספר " +
            ((this
                    .widget
                    .patient
                    .treatmentType
                    .stageList[this.widget.stageLevel]
                    .exerciseList[this.widget.exerciseLevel]).level+1)
                .toString()),
      ),
      body: _body(),
    );
    //
  }

  Widget _body() {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: widget.questions.length,
                  itemBuilder: (context, itemIndex) {
                    int index;
                    Report report;
                    ReportController reportController;
                    Future<bool> f;
                    Future<bool> f1;
                    int score = 0;
                    String openAnswer;

                    return Column(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                        child: Text(
                         this.widget.questions[itemIndex],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      RadioButtonGroup(
                        // orientation: GroupedButtonsOrientation.VERTICAL,
                        margin: const EdgeInsets.fromLTRB(0, 0, 1, 0),
                        labels: this.widget.option_answers,
                        disabled: [],
                        onChange: (String label, int choose_index) {
                          index = choose_index;
                        },
                        onSelected: (String label) => {
                          this.widget.answers[itemIndex] = index,
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      if (itemIndex == this.widget.questions.length - 1)
                        new TextField(
                          controller: textController,
                          decoration: new InputDecoration(
                            hintText: "הערות ",
                            labelText: ",רשום הערות",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(),
                            ),
                            //fillColor: Colors.green
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      if (itemIndex == this.widget.questions.length - 1)
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () => {
                            Navigator.of(context).pop(),
                            Navigator.of(context).pop(),
                            Navigator.of(context).pop(),
                            score = LogicHelpers.calculateScoreOfQuestions(
                                this.widget.answers),
                            report = new Report(
                                this.widget.stageLevel,
                                this.widget.exerciseLevel,
                                this.widget.questions,
                                this.widget.answers,
                                textController.text,
                                score),
                            reportController = new ReportController(),
                            reportController.report = report,
                            f = reportController
                                .createReport(this.widget.patient.username),
                            if (score > threshold)
                              {
                                if (this.widget.exerciseLevel ==
                                    numberOfExercises)
                                  {
                                    f1 = accessController.updateAccess(
                                        this.widget.stageLevel + 1,
                                        0,
                                        this.widget.patient.username,
                                        true),
                                    this
                                        .widget
                                        .patient
                                        .accessesStageList[
                                            this.widget.stageLevel + 1]
                                        .stageAccess = true,
                                    this
                                        .widget
                                        .patient
                                        .accessesStageList[
                                            this.widget.stageLevel + 1]
                                        .exerciseAccess[0] = true,
                                    Toast.show("מזל טוב!!! עברת שלב", context,
                                        duration: Toast.LENGTH_LONG, gravity: Toast.CENTER,backgroundColor: Colors.greenAccent),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MedicalInspectionStage(
                                                    this.widget.patient, true)))
                                  }
                                else
                                  {
                                    f1 = accessController.updateAccess(
                                        this.widget.stageLevel,
                                        this.widget.exerciseLevel + 1,
                                        this.widget.patient.username,
                                        false),
                                    this
                                            .widget
                                            .patient
                                            .accessesStageList[
                                                this.widget.stageLevel]
                                            .exerciseAccess[
                                        this.widget.exerciseLevel + 1] = true,
                                  Toast.show("מזל טוב!!! עברת לתרגיל הבא", context,
                                  duration: Toast.LENGTH_LONG, gravity: Toast.CENTER,backgroundColor: Colors.blueAccent),
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StagePage(
                                                  patient: this.widget.patient,
                                                  stageIndex:
                                                      this.widget.stageLevel,
                                                )))
                                  },
                              }
                            else
                              {
                                Toast.show("לא עברת את התרגיל הנוכחי. אנא נסה שוב", context,
                                    duration: Toast.LENGTH_LONG, gravity: Toast.CENTER,backgroundColor: Colors.red),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => StagePage(
                                              patient: this.widget.patient,
                                              stageIndex:
                                                  this.widget.stageLevel,
                                            )))
                              },
                          },
                          color: Colors.green,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            // Replace with a Row for horizontal icon + text
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "אישור",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                    ]);
                  })),
        ],
      ),
    );
  }
}
