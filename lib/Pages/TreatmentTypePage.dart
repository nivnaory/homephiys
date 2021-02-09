
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homephiys/Entity/Paitent.dart';

import 'MedicalInspectionStage.dart';
import 'ProtocolsPage.dart';

class TreatmentTypePage extends StatefulWidget {
  final Paitent paitent;

  TreatmentTypePage({@required this.paitent});

  _TreatmentTypePage createState() => _TreatmentTypePage();
}

class _TreatmentTypePage extends State<TreatmentTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.lightBlue,
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 30.0,
        mainAxisSpacing: 100.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        children: <Widget>[
          FlatButton(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(100)),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MedicalInspectionStage
                        (treatmentType:widget.paitent.getTreatmentType[0],protocol:this.widget.paitent.getProtocol)))
            },
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Column(
        // Replace with a Row for horizontal icon + text
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.bookmark, size: 50, color: Colors.deepOrange),
                Text("רשימת תרגילים",
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
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProtocolsPage(protocol:this.widget.paitent.getProtocol)
                   )
                 )
               },
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Column(
// Replace with a Row for horizontal icon + text
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.chat, size: 50, color: Colors.green),
                Text("פרוטוקולים",
                    style: TextStyle(fontSize: 20, color: Colors.green))
              ],
            ),
          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 200.0),
          StaggeredTile.extent(2, 200.0),
        ],
      ),
    );
  }
}
