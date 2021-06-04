import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');
  return "$hours:$minutes:$seconds";
}
class Daniel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Stopwatch Example', home: StopwatchPage());
  }
}
class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}
class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch;
  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }
  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }
    setState(() {});    // re-render the page
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stopwatch Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(formatTime(_stopwatch.elapsedMilliseconds), style: TextStyle(fontSize: 48.0)),
            ElevatedButton(onPressed: handleStartStop, child: Text(_stopwatch.isRunning ? 'Stop' : 'Start')),
          ],
        ),
      ),
    );
  }
}