import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Entity/Patient.dart';
import 'package:homephiys/Pages/TreatmentProgressPage.dart';
import 'package:toast/toast.dart';
import 'StagePage.dart';

class MedicalInspectionStage extends StatefulWidget {
  final Paitent patient;
  final bool StagePageBool;
  MedicalInspectionStage(this.patient, this.StagePageBool);

  _MedicalInspectionStage createState() => _MedicalInspectionStage();
}

class _MedicalInspectionStage extends State<MedicalInspectionStage> {
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
        children: List.generate(
            this.widget.patient.treatmentType.protocol.subProtocolsList.length,
            (index) {
          if (this.widget.patient.accessesStageList[index].stageAccess ==
              true) {
            return StageWidget(
              paitent: this.widget.patient,
              enable: true,
              color: Colors.white,
              index: index,
              StagePageBool: this.widget.StagePageBool,
            );
          } else {
            return StageWidget(
              paitent: this.widget.patient,
              color: Colors.grey,
              enable: false,
              index: index,
              StagePageBool: this.widget.StagePageBool,
            );
          }
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
    this.paitent,
    this.index,
    this.StagePageBool,
  }) : super(key: key);
  final bool StagePageBool;
  final Color color;
  final bool enable;
  final Paitent paitent;
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
                if (this.widget.enable == true) {
                  if (this.widget.StagePageBool)
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StagePage(
                                patient: this.widget.paitent,
                                stageIndex: this.widget.index)));
                  else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TreatmentProgressPage(
                                paitent: this.widget.paitent,
                                stageIndex: this.widget.index)));
                  }
                } else {
                  Toast.show("not have access yet", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                }
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
                          .paitent
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
