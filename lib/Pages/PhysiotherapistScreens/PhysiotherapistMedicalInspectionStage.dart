import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Entity/Patient.dart';

import 'package:toast/toast.dart';

import 'PhysiotherapistStagePage.dart';


class PhysiotherapistMedicalInspectionStage extends StatefulWidget {
  final Patient patient;
  PhysiotherapistMedicalInspectionStage(this.patient);

  _PhysiotherapistMedicalInspectionStage createState() => _PhysiotherapistMedicalInspectionStage();
}

class _PhysiotherapistMedicalInspectionStage extends State<PhysiotherapistMedicalInspectionStage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'שלבי התרגיל הביתי',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: List.generate(
            this.widget.patient.treatmentType.protocol.subProtocolsList.length,
                (index) {
                return StageWidget(
                  patient: this.widget.patient,
                  enable: true,
                  color: Colors.white,
                  index: index,
                );
            }),
      ),
    );
  }
}

class StageWidget extends StatefulWidget {
  const StageWidget({
    Key key,
    this.enable,
    this.color,
    this.patient,
    this.index,

  }) : super(key: key);
  final Color color;
  final bool enable;
  final Patient patient;
  final int index;

  _StageWidget createState() => _StageWidget();
}

class _StageWidget extends State<StageWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              //stage1 stag
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PhysiotherapistStagePage(patient:this.widget.patient,stageIndex:this.widget.index,)));
              },
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 400.0,
                    ),
                    Text(
                      this
                          .widget
                          .patient
                          .treatmentType
                          .protocol
                          .subProtocolsList[this.widget.index]
                          .name,
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
                color: this.widget.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatefulWidget {
  final Widget cardChild;
  final Color color;
  ReusableCard({this.cardChild, this.color});

  _ReusableCard createState() => _ReusableCard();
}

class _ReusableCard extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.widget.cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: this.widget.color,
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
