import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Entity/Paitent.dart';
import 'package:toast/toast.dart';
import 'StagePage.dart';

class MedicalInspectionStage extends StatefulWidget {
  final Paitent paitent;
  MedicalInspectionStage(@required this.paitent);

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
            this
                .widget
                .paitent
                .getTreatmentType
                .getProtocol
                .subProtocolsList
                .length, (index) {
          if (this.widget.paitent.accessesStageList[index].stageAccess ==
              true) {
            return StageWidget(
              paitent: this.widget.paitent,
              enable: true,
              color: Colors.white,
              index: index,
            );
          } else {
            return StageWidget(
              paitent: this.widget.paitent,
              color: Colors.grey,
              enable: false,
              index: index,
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
  }) : super(key: key);

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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StagePage(
                              paitent: this.widget.paitent,
                              stageIndex: this.widget.index)));
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
                          .getTreatmentType
                          .getProtocol
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
