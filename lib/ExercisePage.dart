



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Exercise.dart';

class ExercisePage extends StatefulWidget {
  final Exercise exercise;
  ExercisePage({@required this.exercise});
  _ExercisePage createState() => _ExercisePage();
}


class _ExercisePage extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Exercise',
          style: TextStyle(color: Colors.white),
        ),
      ),
         body:Column(
             children: <Widget>[
          ]
         )
      ,);
  }
}