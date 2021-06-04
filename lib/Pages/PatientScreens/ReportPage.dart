import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:homephiys/Controller/AccessController.dart';
import 'package:homephiys/Entity/Report.dart';

class ReportPage extends StatefulWidget {
  final Report reprot;
  final List<String> option_answers = [
    "במידה מועטה מאוד", //0
    "במידה מועטה", //1
    "מידה בינונית", //2
    " במידה רבה ", //3
    " במידה רבה מאוד ", //4
  ];

  ReportPage({this.reprot});

  @override
  _ReportPage createState() => _ReportPage();
}

class _ReportPage extends State<ReportPage> {
  TextEditingController textController = new TextEditingController();
  int threshold = 0;
  int numberOfExercises = 0;

  AccessController accessController = new AccessController();

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Report:"),
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
                  itemCount: 3,
                  itemBuilder: (context, itemIndex) {
                    // List<int>answers=List();
                    return Column(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                        child: Text(
                          "question",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      RadioButtonGroup(
                        // orientation: GroupedButtonsOrientation.VERTICAL,
                        margin: const EdgeInsets.fromLTRB(0, 0, 1, 0),
                        picked: this.widget.option_answers[
                            this.widget.reprot.answers[itemIndex]],
                        labels: this.widget.option_answers,
                        disabled: this.widget.option_answers,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      if (itemIndex == 2)
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black26),
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (context) => CustomDialog(
                                      title: "תשובה פתוחה",
                                      descritpion:
                                          this.widget.reprot.openAnswers,
                                    )),
                          },
                          color: Colors.green,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            // Replace with a Row for horizontal icon + text
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "צפה בהערה",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(
                        height: 30.0,
                      ),
                    ]);
                  })),
        ],
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final String title, descritpion;

  CustomDialog({this.title, this.descritpion});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      elevation: 0,
      backgroundColor: Colors.white,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 26, left: 40, right: 20),
          margin: EdgeInsets.only(top: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 20.0,
                    offset: Offset(10.0, 10.0))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0)),
              SizedBox(
                height: 10.0,
              ),
              Text(descritpion,
                  style: TextStyle(fontSize: 18.0, letterSpacing: 1.0)),
              SizedBox(height: 20.0)
            ],
          ),
        ),
      ],
    );
  }
}
