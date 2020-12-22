import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'Exercise.dart';

class ExercisePage extends StatefulWidget {
  final Exercise exercise;
  final url = 'https://www.youtube.com/watch?v=tr6XsZVb-ZE';
  final title = 'Player';

  ExercisePage({@required this.exercise});

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
        )
    );
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
        ' Exercise',
        style: TextStyle(color: Colors.white),
    ),
    ),
    body:StaggeredGridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 12.0,
    mainAxisSpacing: 12.0,
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    children: <Widget>[
    YoutubePlayerBuilder(
    player: YoutubePlayer(
    controller: _controller,
    ),
    builder: (context, player){
    return Scaffold(
    body: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    player,
    SizedBox(height: 10,),

    ]
    )
    );
    }
    ) ,
    ]

    ,
    staggeredTiles: [
    StaggeredTile.extent(2, 200.0),

    ],
    ));
  }
}