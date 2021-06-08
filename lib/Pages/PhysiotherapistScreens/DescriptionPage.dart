import 'package:flutter/material.dart';
import 'package:homephiys/Controller/PatientController.dart';
import 'package:homephiys/Controller/TherapistController.dart';
import 'package:homephiys/Pages/PhysiotherapistScreens/PhysiotherapistWatchExercisePage.dart';

//Define "root widget"
 //one-line function

class DescriptionPage extends StatelessWidget {
  //Stateless = immutable = cannot change object's properties
  //Every UI components are widgets
  final textController = TextEditingController();
  final patientController= new PatientController();
  bool isPhysioNoteChange;
  String patientUserName = "";
  int exerciseIndex;
  int stageIndex;
  DescriptionPage(String inputText,{this.isPhysioNoteChange,this.patientUserName, this.exerciseIndex, this.stageIndex}){
    textController.text=inputText;

  }

  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0), //Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: new Text("הסבר: ",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    textDirection: TextDirection.rtl,
                  ),

                ),
                //Need to add space below this Text ?

                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 20,
                    maxLength: 1000,
                    onChanged: (value) {},
                      controller: textController,
                      textDirection: TextDirection.rtl,

                    ),

                SizedBox(height:40),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: ()  {
                  if(isPhysioNoteChange){
                    //put
                    Future<bool> futureTherapistNote = this.patientController.setNewNoteForPatient(this.patientUserName,this.textController.text.trim(),
                    this.exerciseIndex,this.stageIndex);
                    print(this.textController.text.trim());
                    Navigator.of(context).pop();

                  }
                    //put
                  },
                   color: Colors.redAccent,
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "עריכה",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
    //build function returns a "Widget"
    return new Scaffold(
            appBar: AppBar(
              title: Text("הערות פיזיותרפיסט",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: new ListView(
              children: <Widget>[
             //   new Image.asset('images/tutorialChannel.png', fit: BoxFit.cover),
                //You can add more widget bellow
                titleSection
              ],
            )); //Widget with "Material design"
  }


}
