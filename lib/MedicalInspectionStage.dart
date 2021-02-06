import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homephiys/StagePage.dart';

import 'TreatmentType.dart';


class MedicalInspectionStage extends StatefulWidget {
  final TreatmentType treatmentType;
  MedicalInspectionStage({@required this.treatmentType});
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
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 50.0,
        padding: EdgeInsets.symmetric(horizontal: 26.0, vertical: 100.0),
        children: <Widget>[
          ListView.builder(
              itemCount:widget.treatmentType.getStageList.length,
              itemBuilder: (context, itemIndex) {
                return FlatButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Text("Inspection No. :"+widget.treatmentType.getStageList[itemIndex].getCurrentLevel.toString()),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StagePage(stage:widget.treatmentType.getStageList[itemIndex])));
                    });
              })
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