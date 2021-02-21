import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class QuestionsPage extends StatefulWidget {
  final List<String> questions;
  final List<String> answers = [
    " במידה רבה מאוד ",
    " במידה רבה ",
    "מידה בינונית",
    "במידה מועטה",
    "במידה מועטה מאוד"
  ];

  QuestionsPage({@required this.questions});

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
                        labels: this.widget.answers,
                        disabled: [],
                        onChange: (String label, int index) => print(
                            "label: $label index: $index question: $itemIndex"),
                        onSelected: (String label) => print(label),
                      ),
                      if (itemIndex == this.widget.questions.length-1)
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () => {},
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
    /*return Column(children: <Widget>[
     ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context, itemIndex) {
          return Column(children: <Widget>[
          Container(
          padding: const EdgeInsets.only(left: 14.0, top: 14.0),
            child:Text(this.widget.questions[itemIndex],style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20),
            ),
          ),
           RadioButtonGroup(
          labels: this.widget.answers,
          disabled: [],
          onChange: (String label, int index) =>
          print("label: $label index: $index question: $itemIndex"),
          onSelected: (String label) => print(label),
              ),
             ]
           );
           }
        ),
    ],
    );*/
  }
}
