import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homephiys/Controller/PatientController.dart';

import 'package:homephiys/Entity/Patient.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'QuestionsPage.dart';

class ExercisePage extends StatefulWidget {
  final url = 'https://www.youtube.com/watch?v=88LR61WGvEQ';
  final title = 'Player';
  final Patient patient;
  final int stageIndex;
  final int exerciseIndex;
  String timeRecord = "";
  int highScore = 0;
  PatientController patientController = new PatientController();

  ExercisePage({this.patient, this.stageIndex, this.exerciseIndex});

  _ExercisePage createState() => _ExercisePage();
}

class _ExercisePage extends State<ExercisePage> {
  YoutubePlayerController _controller;


  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: false,
        ));
  }

  Stopwatch _stopwatch;
  @override
  void initState() {
    runYoutubePlayer();
    _stopwatch = Stopwatch();
     this.widget.highScore =
     this.widget.patient.highScores[this.widget.stageIndex][this.widget.exerciseIndex];
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handleStartStop() {
    if (_stopwatch.isRunning) {

      _stopwatch.stop();
      this.widget.timeRecord = formatTime(_stopwatch.elapsedMilliseconds);

    } else {
      _stopwatch.start();
      this.widget.timeRecord = formatTime(_stopwatch.elapsedMilliseconds);
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          this.widget.timeRecord = formatTime(_stopwatch.elapsedMilliseconds);
        });
      });
    }
  }

  void reset() {
    if (this.widget.highScore < _stopwatch.elapsedMilliseconds) {
      showDialog(
        context: context,
        builder: (context) => CustomDialog(
            title: "!!!!!מזל טוב ",
            descritpion: "שברת את השיא"
      ));
      this.widget.highScore = _stopwatch.elapsedMilliseconds;
    }
    _stopwatch.reset();
    setState(() {
      this.widget.timeRecord = formatTime(_stopwatch.elapsedMilliseconds);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            ' תרגול מספר ' +
                ((this
                    .widget
                    .patient
                    .treatmentType
                    .stageList[this.widget.stageIndex]
                    .exerciseList[this.widget.exerciseIndex]).level+1)
                    .toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 40.0,
          mainAxisSpacing: 30.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.red,
                  ),
                ),
                builder: (context, player) {
                  return Scaffold(
                      body: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        player,
                        SizedBox(
                          height: 10,
                        ),
                      ]));
                }),
            FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () => {},
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "זמן שיא " + formatTime(this.widget.highScore),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                      title: "הסבר תרגיל ",
                      descritpion: this
                          .widget
                          .patient
                          .treatmentType
                          .stageList[this.widget.stageIndex]
                          .exerciseList[this
                              .widget
                              .patient
                              .treatmentType
                              .stageList[this.widget.stageIndex]
                              .currentLevel]
                          .description),
                )
              },
              color: Colors.blueGrey,
              padding: EdgeInsets.all(10.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "הסבר על התרגיל",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(this.widget.timeRecord, style: TextStyle(fontSize: 48.0)),
                ElevatedButton(
                  onPressed: handleStartStop,
                  child: Text(_stopwatch.isRunning ? 'עצור' : 'התחל'),
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: reset, child: Text("איפוס")),
              ],
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                      title: "הסבר פיזיותרפיסט ",
                      descritpion: this
                              .widget
                              .patient
                              .therapistNote[this.widget.stageIndex]
                          [this.widget.exerciseIndex]),
                )
              },
              color: Colors.blueGrey,
              child: Column(
                // Replace with a Row for horizontal icon + text
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "הערות פיזיותרפיסט",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
    if(this.widget.highScore>this.widget.patient.highScores[this.widget.stageIndex][this.widget.exerciseIndex]) {
      //put
      this.widget.patient.highScores[this.widget.stageIndex][this.widget.exerciseIndex] = this.widget.highScore;
      Future<bool> futureHighScore = this.widget.patientController.saveHighScore
        (this.widget.highScore, this.widget.patient.username,
          this.widget.stageIndex, this.widget.exerciseIndex);
      futureHighScore.then((value) {
        //need this
      });
    }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionsPage(

                              exerciseLevel: this.widget.exerciseIndex,
                              stageLevel: this.widget.stageIndex,
                              patient: this.widget.patient,
                            )));
              },
              color: Colors.green,
              child: Column(
                // Replace with a Row for horizontal icon + text
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "סיים תרגיל",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 200.0), //video
            StaggeredTile.extent(1, 100.0), //זמן שיא
            StaggeredTile.extent(1, 100.0), //הסבר תרגיל
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 50.0),
            StaggeredTile.extent(2, 50.0),
          ],
        ));
  }
}

class CustomDialog extends StatelessWidget {
  final String title, descritpion;
  CustomDialog({this.title, this.descritpion});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      elevation: 0,
      backgroundColor: Colors.white,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 26, left: 40, right: 20),
          margin: EdgeInsets.only(top: 5.0),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 20.0,
                    offset: Offset(10.0, 10.0))
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0)),
              SizedBox(
                height: 10.0,
              ),
              Text(descritpion,
                  style: TextStyle(fontSize: 18.0, letterSpacing: 1.0)),
              SizedBox(height: 20.0)
            ],
          ),
        ),
      ],
    );
  }
}

String formatTime(int milliseconds) {
  var secs = (milliseconds ~/ 1000);
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');
  return "$hours:$minutes:$seconds";
}

