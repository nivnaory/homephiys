import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homephiys/Entity/Stage.dart';
import 'ExercisePage.dart';

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
        crossAxisCount: 3,
        crossAxisSpacing: 30.0,
        mainAxisSpacing: 80.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 70.0),
        children: <Widget>[
          ListView.builder(
              itemCount:widget.stage.getExerciseList.length,
              itemBuilder: (context, itemIndex) {
                return FlatButton(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.white,
                    padding: EdgeInsets.all(65.0),
                    child: Text("תרגיל מספר :"+widget.
                    stage.getExerciseList[itemIndex].getLevel.toString(),style: TextStyle(fontSize: 22, color: Colors.black)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExercisePage(exercise:widget.stage.getExerciseList[itemIndex])));
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
