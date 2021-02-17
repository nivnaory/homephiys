import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';


class QuestionsPage extends StatefulWidget {
  final List<String> questions;
  QuestionsPage({@required this.questions});
  @override
  _QuestionsPage createState() => _QuestionsPage();
}

class _QuestionsPage extends State<QuestionsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grouped Buttons Example"),
      ),
      body: _body(),
    );
    //
  }

  Widget _body() {
    return ListView(children: <Widget>[
      //--------------------
      //SIMPLE USAGE EXAMPLE
      //-------------------
      //BASIC CHECKBOXGROUP

      //BASIC RADIOBUTTONGROUP
      Container(
        padding: const EdgeInsets.only(left: 14.0, top: 14.0),
        child: Text(
          "Basic RadioButtonGroup",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),

      RadioButtonGroup(
        labels: [
          this.widget.questions[0],
          this.widget.questions[1]
        ],
        disabled: ["Option 1"],
        onChange: (String label, int index) =>
            print("label: $label index: $index"),
        onSelected: (String label) => print(label),
      )
    ]);
  }
}