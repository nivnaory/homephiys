import 'package:flutter/material.dart';
import 'dart:async';

class ElapsedTime {
  final int hundreds;
  final int seconds;
  final int minutes;

  ElapsedTime({
    this.hundreds,
    this.seconds,
    this.minutes,
  });
}

class Dependencies {

  final List<ValueChanged<ElapsedTime>> timerListeners = <ValueChanged<ElapsedTime>>[];
  final TextStyle textStyle = const TextStyle(fontSize: 50.0, fontFamily: "Bebas Neue");
  final Stopwatch stopwatch = new Stopwatch();
  final int timerMillisecondsRefreshRate = 30;
}
void startStopWatch(){
}
void stopStopWatch(){

}
void resetStopWatch(){

}
class TimerPage extends StatefulWidget {
  TimerPageState createState() => new TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  bool startIsPressed = true;
  bool stopIsPressed = true;
  bool resetIsPressed = true;
  String stopTimeToDisplay = "00:00:00";


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(flex: 6,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                   stopTimeToDisplay ,
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    )
                ),
              )
          ),
          Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                    RaisedButton(
                      onPressed: stopIsPressed ? null : stopStopWatch,
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        "Stop",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: resetIsPressed?null :resetStopWatch,
                      color: Colors.teal,
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        "Reset",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: startIsPressed ? startStopWatch : null,
                      color: Colors.green,
                      padding: EdgeInsets.symmetric(
                        horizontal: 60.0,
                        vertical: 15.0,
                      ),
                      child: Text(
                        "Start",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
