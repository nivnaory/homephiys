import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:homephiys/Entity/Paitent.dart';

import 'MedicalInspectionStage.dart';
import 'ProtocolsPage.dart';

class TreatmentAndProtocolPage extends StatelessWidget {
  final Paitent paitent;
  TreatmentAndProtocolPage({@required this.paitent});
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
                              builder: (context) =>
                                  MedicalInspectionStage(paitent)));
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
                            style: TextStyle(
                                fontSize: 30, color: Colors.deepOrange),
                          ),
                          SizedBox(
                            width: 400.0,
                          ),
                          Icon(Icons.bookmark,
                              size: 50, color: Colors.deepOrange),
                        ],
                      ),
                    ))),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProtocolsPage(
                                  protocol:
                                      paitent.getTreatmentType.getProtocol)));
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
                    ))),
          ],
        ));
  }
}
