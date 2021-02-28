import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:homephiys/Controller/ReportController.dart';
import 'package:homephiys/Entity/Report.dart';

class QuestionsPage extends StatefulWidget {
  final List<String> questions;

  final int stageLevel;
  final int exercieLevel;
  final List<String> option_answers = [
    " במידה רבה מאוד ",
    " במידה רבה ",
    "מידה בינונית",
    "במידה מועטה",
    "במידה מועטה מאוד"
  ];


  QuestionsPage({@required this.questions,this.stageLevel,this.exercieLevel});

  @override
  _QuestionsPage createState() => _QuestionsPage();
}

class _QuestionsPage extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
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
                    Report report;
                    ReportController reportController;
                    Future<bool> f;
                    List<int>answers=List(this.widget.questions.length);
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
                        labels: this.widget.option_answers,
                        disabled: [],
                        onChange: (String label, int index) => print(
                            "label: $label index: $index question: $itemIndex"),
                        onSelected: (String label) =>
                        answers[itemIndex]=1,
                      ),
                      if (itemIndex == this.widget.questions.length-1)
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () => {
                            //crete new Report
                             report = new Report(this.widget.stageLevel,this.widget.exercieLevel,
                             this.widget.questions,answers,
                             "hello",1),
                             print(answers),
                             print(report.getAnswers()),
                              reportController= new ReportController(report),

                              f=  reportController.createReport("411111111"),
                              f.then((value){
                             if(value==true){
                               print("successs get back to exercise page");
                             }else{
                               print("Eror");
                             }
                            })
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
                         ]
                       );
                     }
                  )
            ),
        ],
      ),
    );

  }
}
