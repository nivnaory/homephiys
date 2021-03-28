import 'dart:convert';

import 'package:homephiys/Entity/Report.dart';
import 'package:http/http.dart' as http;
class ReportController {
  Report _report;


  set report(Report value) {
    _report = value;
  }
  Report getReport(){
    return this._report;
  }
  ReportController( Report report){
    this._report=report;
  }


  Future<bool> createReport(String username) async {

  final response = await http.post(
    'http://10.0.2.2:5000/paitent/${username}/report'
      //  'http://192.168.1.28:5000/paitent/${username}/report'

    ,
    headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, Object> {
    'stageLevel': this._report.getStage(),
    'exerciseLevel': this._report.getExercise(),
    'questions': this._report.getQuestions(),
    'answers': this._report.getAnswers(),
    'openAnswer': this._report.getOpenAnswer(),
    'totalScore': this._report.getScore(),
    }),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON
    return Future.value(true);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return Future.value(false);
    throw Exception('Failed to load Paitent');
  }
  }
}