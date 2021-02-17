import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Entity/Protocol.dart';
import 'package:homephiys/Entity/TreatmentType.dart';
import 'StagePage.dart';

class MedicalInspectionStage extends StatelessWidget {
  final TreatmentType treatmentType;
  final Protocol protocol;
  MedicalInspectionStage({@required this.treatmentType, @required this.protocol});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'home Exercise',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: <Widget>[
          for (int i = 0; i < protocol.subProtocolsList.length; i++)
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StagePage(
                                    stage:treatmentType
                                        .getStageList[i])));
                      },
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 400.0,
                            ),
                            Text(
                              protocol.subProtocolsList[i].name,
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }}


class ReusableCard extends StatelessWidget {
  final Widget cardChild;
  ReusableCard({this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
