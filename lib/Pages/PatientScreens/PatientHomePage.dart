import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homephiys/Entity/Patient.dart';
import 'package:homephiys/Pages/PatientScreens/ChatPage.dart';


import 'MedicalInspectionStage.dart';
import 'TreatmentAndProtocolPage.dart';

class PatientHomePage extends StatelessWidget {
  final Patient patient;
  PatientHomePage({@required this.patient});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'תפריט המטופל',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.lightBlue,
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(100)),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TreatmentAndProtocolPage(
                          patient: this.patient))),
            },
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Column(
              // Replace with a Row for horizontal icon + text
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.directions_run, size: 50.0, color: Colors.black),
                Text(
                  "תרגיל ביתי",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(100)),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MedicalInspectionStage(this.patient, false)))
            },
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Column(
              // Replace with a Row for horizontal icon + text
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.bookmark, size: 50, color: Colors.deepOrange),
                Text("התקדמות טיפול",
                    style: TextStyle(fontSize: 20, color: Colors.deepOrange)),
              ],
            ),
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(100)),
            onPressed: () => {

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChatPage()))
            },
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Column(
              // Replace with a Row for horizontal icon + text
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.chat, size: 50, color: Colors.green),
                Text("צור קשר",
                    style: TextStyle(fontSize: 20, color: Colors.green))
              ],
            ),
          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 200.0),
          StaggeredTile.extent(2, 200.0),
          StaggeredTile.extent(2, 200.0),
        ],
      ),
    );
  }
}
