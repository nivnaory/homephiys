import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:homephiys/Stage.dart';

import 'ExercisePage.dart';
import 'TreatmentType.dart';


class StagePage extends StatefulWidget {
  final Stage stage;
  StagePage({@required this.stage});
  _StagePage createState() => _StagePage();
}


class _StagePage extends State<StagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Exercise List',
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
              itemCount:widget.stage.getExerciseList.length,
              itemBuilder: (context, itemIndex) {
                return FlatButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Text("Exercies :"+widget.stage.getExerciseList[itemIndex].getLevel.toString()),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExercisePage(exercise:widget.stage.getExerciseList[itemIndex])));
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
