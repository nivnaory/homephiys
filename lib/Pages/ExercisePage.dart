import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:homephiys/Entity/Patient.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'QuestionsPage.dart';

class ExercisePage extends StatefulWidget {
  final url = 'https://www.youtube.com/watch?v=88LR61WGvEQ';
  final title = 'Player';
  final highScore = 13.0000;
  final Patient patient;
  final int stageIndex;
  final int exerciseIndex;

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

  @override
  void initState() {
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
            ' תרגול מספר ' + (this.widget.exerciseIndex+1).toString(),
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
                    "זמן שיא :" + widget.highScore.toString(),
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
                          .exerciseList[this.widget.exerciseIndex]
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
            FlatButton(
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black26),
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () => {},
              color: Colors.redAccent,
              padding: EdgeInsets.all(10.0),
              child: Column(
                // Replace with a Row for horizontal icon + text
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "התחל תרגיל",
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionsPage(
                              questions: this
                                  .widget
                                  .patient
                                  .treatmentType
                                  .stageList[this.widget.stageIndex]
                                  .exerciseList[this.widget.exerciseIndex]
                                  .questions,
                              exerciseLevel: this.widget.exerciseIndex,
                              stageLevel: this.widget.stageIndex,
                              patient: this.widget.patient,
                            )))
              },
              color: Colors.green,
              padding: EdgeInsets.all(10.0),
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
            StaggeredTile.extent(2, 200.0),
            StaggeredTile.extent(1, 100.0),
            StaggeredTile.extent(1, 100.0),
            StaggeredTile.extent(2, 150.0),
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
