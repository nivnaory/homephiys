import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:homephiys/Entity/Patient.dart';
import 'package:homephiys/Pages/PatientScreens/ExercisePage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'DescriptionPage.dart';

class PhysiotherapistWatchExercisePage extends StatefulWidget {
  final url = 'https://www.youtube.com/watch?v=88LR61WGvEQ';
  final title = 'Player';
  final Patient patient;
  final int stageIndex;
  final int exerciseIndex;
  int highScore = 0;
  TextEditingController notesController;

  PhysiotherapistWatchExercisePage(
      {this.patient, this.stageIndex, this.exerciseIndex});

  _PhysiotherapistWatchExercisePage createState() =>
      _PhysiotherapistWatchExercisePage();
}

class _PhysiotherapistWatchExercisePage
    extends State<PhysiotherapistWatchExercisePage> {
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

  @override
  void initState() {
   this.widget.highScore= this.widget.patient.highScores[this.widget.stageIndex][this.widget.exerciseIndex];
    runYoutubePlayer();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            ' תרגול מספר ' +
                (this
                            .widget
                            .patient
                            .treatmentType
                            .stageList[this.widget.stageIndex]
                            .currentLevel +
                        1)
                    .toString(),
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 40.0,
          mainAxisSpacing: 40.0,
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
                    "זמן שיא של המטופל: " + formatTime(this.widget.highScore).toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(60)),
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
                ),
              },
              color: Colors.green,
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
            FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(60)),
              onPressed: () => {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => DescriptionPage(
                  this.widget.patient.therapistNote[this.widget.stageIndex][this.widget.exerciseIndex],
                  isPhysioNoteChange:true,patientUserName: this.widget.patient.username,exerciseIndex: this.widget.exerciseIndex,stageIndex: this.widget.stageIndex))),
              },
              color: Colors.green,
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
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 200.0),
            StaggeredTile.extent(2, 150.0),
            StaggeredTile.extent(1, 150.0),
            StaggeredTile.extent(1, 150.0),
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
  String formatTime(int milliseconds) {
    var secs = (milliseconds ~/ 1000);
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
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
