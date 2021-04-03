import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:homephiys/Controller/AccessController.dart';
import 'package:homephiys/Controller/ReportController.dart';
import 'package:homephiys/Entity/Paitent.dart';
import 'package:homephiys/Entity/Report.dart';
import 'package:homephiys/Pages/MedicalInspectionStage.dart';
import 'package:homephiys/Pages/StagePage.dart';

import 'ExercisePage.dart';

class QuestionsPage extends StatefulWidget {
  final List<String> questions;

  final int stageLevel;
  List<int> answers = [];
  final int exerciseLevel;
  final Paitent paitent;

  final List<String> option_answers = [
    " במידה רבה מאוד ", //0
    " במידה רבה ", //1
    "מידה בינונית", //2
    "במידה מועטה", //3
    "במידה מועטה מאוד" //4
  ];

  QuestionsPage(
      {@required this.questions,
      this.stageLevel,
      this.exerciseLevel,
      this.paitent});

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
    super.initState();
    threshold = ((this.widget.questions.length * 5) * 0.8).toInt();
    numberOfExercises = this
            .widget
            .paitent
            .getTreatmentType
            .getStageList[this.widget.stageLevel]
            .getExerciseList
            .length -
        1;
  }

  @override
  Widget build(BuildContext context) {
    this.widget.answers = List<int>.filled(this.widget.questions.length, 0);
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePhiys Questions:"),
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
                    // List<int>answers=List();
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
                          this.widget.answers[itemIndex] = index + 1,
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
                            score =
                                calculateScoreOfQuestions(this.widget.answers),
                            report = new Report(
                                this.widget.stageLevel,
                                this.widget.exerciseLevel,
                                this.widget.questions,
                                this.widget.answers,
                                textController.text,
                                score),
                            reportController = new ReportController(report),
                            f = reportController
                                .createReport(this.widget.paitent.getUserName),
                            if (score > threshold)
                              {
                                if (this.widget.exerciseLevel ==
                                    numberOfExercises)
                                  {
                                    f1 = accessController.updateAccess(
                                        this.widget.stageLevel + 1,
                                        0,
                                        this.widget.paitent.getUserName,
                                        true),
                                    print(numberOfExercises),
                                    this
                                        .widget
                                        .paitent
                                        .accessesStageList[
                                            this.widget.stageLevel + 1]
                                        .stageAccess = true,
                                    this
                                        .widget
                                        .paitent
                                        .accessesStageList[
                                            this.widget.stageLevel + 1]
                                        .exerciseAccess[0] = true,
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MedicalInspectionStage(
                                                  this.widget.paitent,
                                                )))
                                  }
                                else
                                  {
                                    f1 = accessController.updateAccess(
                                        this.widget.stageLevel,
                                        this.widget.exerciseLevel + 1,
                                        this.widget.paitent.getUserName,
                                        false),
                                    this
                                            .widget
                                            .paitent
                                            .accessesStageList[
                                                this.widget.stageLevel]
                                            .exerciseAccess[
                                        this.widget.exerciseLevel + 1] = true,
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => StagePage(
                                                  paitent: this.widget.paitent,
                                                  stageIndex:
                                                      this.widget.stageLevel,
                                                )))
                                  },
                              },
                          },

                          // Report report=new Report(this.widget.stageLevel,this.widget.exercieLevel,
                          //this.widget.questions,this.widget.answers,"open answer",10)
                          //ReportController reportController=new ReportController(newReport);
                          //reportcontroller.setReport()
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

int calculateScoreOfQuestions(List<int> answers) {
  int sum = 0;
  for (int i = 0; i < answers.length; i++) {
    sum += answers[i] + 1;
  }
  return sum;
}
