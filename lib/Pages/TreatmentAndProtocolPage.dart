
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homephiys/Entity/Paitent.dart';

import 'MedicalInspectionStage.dart';
import 'ProtocolsPage.dart';

class TreatmentAndProtocolPage extends StatefulWidget {
  final Paitent paitent;

  TreatmentAndProtocolPage({@required this.paitent});

  _TreatmentAndProtocolPage createState() => _TreatmentAndProtocolPage();
}

class _TreatmentAndProtocolPage extends State<TreatmentAndProtocolPage> {
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
        body: Column(
          children: <Widget>[
             Expanded(
                child: GestureDetector(
            onTap: () {
                Navigator.push(
                    context,
                MaterialPageRoute(
                  builder: (context) => MedicalInspectionStage(treatmentType:widget.
                        paitent.getTreatmentType[0],protocol:this.widget.paitent.getProtocol)));
                },
                child: Container(
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),
          ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        ":רשימת תרגילים",
                        style: TextStyle(fontSize: 30, color: Colors.deepOrange),
                      ),
                      SizedBox(
                        width: 400.0,
                      ),
                      Icon(Icons.bookmark, size: 50, color: Colors.deepOrange),
                    ],
                  ),
    )
    )),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProtocolsPage(protocol:this.widget.paitent.getProtocol)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            ":פרוטוקולים ",
                            style: TextStyle(fontSize: 30, color: Colors.green),
                          ),
                          SizedBox(
                            width: 400.0,
                          ),
                          Icon(Icons.chat, size: 50, color: Colors.green),
                        ],
                      ),
                    )
                )),
    ],
    )
    );
  }
}
  /*    body: StaggeredGridView.count(
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
}*/
