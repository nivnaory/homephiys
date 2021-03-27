import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Entity/AccessStage.dart';
import 'package:homephiys/Entity/Protocol.dart';
import 'package:homephiys/Entity/Stage.dart';
import 'package:homephiys/Entity/SubProtocol.dart';
import 'package:homephiys/Entity/TreatmentType.dart';
import 'package:toast/toast.dart';
import 'StagePage.dart';

class MedicalInspectionStage extends StatefulWidget {
  final TreatmentType treatmentType;
  final List<AccessStage> accessStageList;
  final Protocol protocol;
  final String username;
  final int currentScore;

  MedicalInspectionStage(
      {@required this.treatmentType, @required this.protocol, this.username, this.currentScore, this.accessStageList});

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
            this.widget.protocol.subProtocolsList.length, (index) {
          if (this.widget.accessStageList[index].stageAccess == true) {
            return StageWidget(
                stage: this.widget.treatmentType.getStageList[index],
                username: this.widget.username,
                subProtocol: this.widget.protocol.subProtocolsList[index], enable: true,color:Colors.white,);
          } else {
            return StageWidget(
                stage: this.widget.treatmentType.getStageList[index],
                username: this.widget.username,
                subProtocol: this.widget.protocol.subProtocolsList[index],color:Colors.grey,);
          }
        }
        ),
      ),
    );
  }
}


class StageWidget extends StatefulWidget {

  const StageWidget({
    Key key,
    @required this.stage, this.username, this.subProtocol, this.enable, this.color
  }) : super(key: key);
  final Color color;
  final bool enable;
  final Stage stage;
  final String username;
  final SubProtocol subProtocol;


  _StageWidget createState() => _StageWidget();
}
  class _StageWidget extends State<StageWidget>{

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              //stage1 stag
              onTap:() {
                if(this.widget.enable==true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              StagePage(
                                stage: this.widget.stage
                                , username: this.widget.username,
                                currentScore: this.widget.stage
                                    .currentScore,)));
                 }
                else{

                  Toast.show("not have access yet", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);


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
                      this.widget.subProtocol.name,
                      style: TextStyle(fontSize: 25.0),
                    ),
                  ],
                ),
               color:this.widget.color,
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

class _ReusableCard  extends State<ReusableCard>{
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
