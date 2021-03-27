import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homephiys/Entity/Stage.dart';
import 'ExercisePage.dart';

class StagePage extends StatelessWidget {
  final Stage stage;
  final String username;
  final int currentScore;
  StagePage({@required this.stage, this.username, this.currentScore});
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
        children:<Widget>[
          for (int i = 0; i < stage.getExerciseList.length; i++)
            // List.generate(stage.getExerciseList.length,(i){
                   //if(painten/Acesss.array[j][i]==true
                        ExerciseButton(stage:stage,i:i,username:"niv"),
              //  },
     ]
    ),
    );
  }}

class ExerciseButton extends StatelessWidget {
  const ExerciseButton({
    Key key,
    @required this.stage,
    @required this.i,
    @required this.username,
  }) : super(key: key);

  final Stage stage;
  final int i;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                            stage.getExerciseList[i], username: this.username)));
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
                              stage
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
