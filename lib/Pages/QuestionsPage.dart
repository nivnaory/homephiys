import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:homephiys/Controller/ReportController.dart';
import 'package:homephiys/Entity/Report.dart';

class QuestionsPage extends StatefulWidget {
  final List<String> questions;

  final int stageLevel;
  List<int>answers=[];
  final int exercieLevel;
  final List<String> option_answers = [
    " במידה רבה מאוד ",//0
    " במידה רבה ",//1
    "מידה בינונית",//2
    "במידה מועטה",//3
    "במידה מועטה מאוד"//4
  ];


  QuestionsPage({@required this.questions,this.stageLevel,this.exercieLevel});

  @override
  _QuestionsPage createState() => _QuestionsPage();
}

class _QuestionsPage extends State<QuestionsPage> {

  @override
  Widget build(BuildContext context) {
    this.widget.answers=List<int>.filled(this.widget.questions.length, 0);
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
                        labels: this.widget.option_answers,
                        disabled: [],
                        onChange: (String label, int choose_index) {
                             index=choose_index;

                        },
                        onSelected: (String label)=>{
                          this.widget.answers[itemIndex]=index,
                        },
                      ),

                      SizedBox(
                        height: 10.0,
                      ),
                      if (itemIndex == this.widget.questions.length-1)
                        new TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Write the Answer",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(
                              ),
                            ),
                            //fillColor: Colors.green
                          ),
                          validator: (val) {
                            if(val.length==0) {
                              return " ";
                            }else{
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: new TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      if (itemIndex == this.widget.questions.length-1)
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () => {
                            //crete new Report
                            //here we need to calculate the score according to the answers.\

                             report = new Report(this.widget.stageLevel,this.widget.exercieLevel,
                             this.widget.questions,this.widget.answers,
                             "hello",1),
                              reportController= new ReportController(report),
                              f=  reportController.createReport("411111111"),
                              f.then((value){
                             if(value==true){
                               print("successs get back to exercise page");
                               //get back to the exercie list page
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
