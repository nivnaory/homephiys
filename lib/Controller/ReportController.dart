import 'dart:convert';

import 'package:homephiys/Entity/Report.dart';
import 'package:http/http.dart' as http;

class ReportController {
  Report _report;

  set report(Report value) {
    _report = value;
  }

  Report getReport() {
    return this._report;
  }

  ReportController(Report report) {
    this._report = report;
  }

  Future<bool> createReport(String username) async {
    print(this._report.score);
    final response = await http.post(
      //'http://10.0.2.2:5000/paitent/${username}/report'
       // 'http://192.168.1.28:5000/paitent/${username}/report'
      'http://192.168.43.13:5000/paitent/${username}/report'


      ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{
        'stageLevel': this._report.stageLevel,
        'exerciseLevel': this._report.exerciseLevel,
        'questions': this._report.questions,
        'answers': this._report.answers,
        'openAnswer': this._report.openAnswers,
        'score': this._report.score,
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
