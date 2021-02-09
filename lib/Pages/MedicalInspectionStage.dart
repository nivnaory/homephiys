
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homephiys/Entity/Protocol.dart';
import 'package:homephiys/Entity/TreatmentType.dart';

import 'StagePage.dart';

class MedicalInspectionStage extends StatefulWidget {
  final TreatmentType treatmentType;
  final  Protocol protocol;
  MedicalInspectionStage({@required this.treatmentType, @required this.protocol});
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
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 50.0,
        mainAxisSpacing: 100.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: <Widget>[
          ListView.builder(
              itemCount:widget.protocol.subProtocolsList.length,
              itemBuilder: (context, itemIndex) {
                return FlatButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.white,
                    padding: EdgeInsets.all(65.0),
                    child: Text(widget.protocol.subProtocolsList[itemIndex].name
                      ,style: TextStyle(fontSize: 22, color: Colors.black)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StagePage(stage:widget.treatmentType.getStageList[itemIndex])));
                    });
              })
        ],
        staggeredTiles: [
          StaggeredTile.extent(3, 500.0),
          StaggeredTile.extent(2, 300.0),
          StaggeredTile.extent(2, 500.0),
        ],
      ),
    );
  }
}