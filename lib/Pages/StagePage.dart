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
          'home Exercise',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: <Widget>[
          for (int i = 0; i < this.widget.stage.getExerciseList.length; i++)
            Expanded(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExercisePage(
                                    exercise:
                                        this.widget.stage.getExerciseList[i])));
                      },
                      child: ReusableCard(
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 400.0,
                            ),
                            Text(
                              "תרגיל :" +
                                  this
                                      .widget
                                      .stage
                                      .getExerciseList[i]
                                      .getLevel
                                      .toString(),
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
          /*  
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(child: ReusableCard()),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: <Widget>[
              Expanded(child: ReusableCard()),
            ],
          )),
          Expanded(
              child: Column(
            children: <Widget>[
              Expanded(child: ReusableCard()),
            ],
          )),
          */
        ],
      ),
    );
  }
}

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
