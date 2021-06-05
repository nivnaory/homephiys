import 'dart:convert';

import 'package:homephiys/Entity/Patient.dart';
import 'package:homephiys/Entity/Report.dart';
import 'package:http/http.dart' as http;
import 'package:snapshot/snapshot.dart';

class ReportController {
  Report _report;
  ReportController();

  set report(Report value) {
    _report = value;
  }

  Report getReport() {
    return this._report;
  }

  Future<bool> createReport(String username) async {
    final response = await http.post(
      'http://10.0.2.2:5000/patient/${username}/report'
      // 'http://172.20.19.56:5000/patient/${username}/report'
      // 'http://192.168.43.13:5000/patient/${username}/report'

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
      throw Exception('Failed to load patient');
    }
  }

  Future<List<Report>> getReportSFromDB(String username) async {
    final response =
        await http.get('http://10.0.2.2:5000/patient/${username}/allReports'
            // 'http://172.20.19.56:5000/patient/${username}'
            //'http://192.168.43.13:5000/patient/${username}'

            );
    List<Report> reportList = [];
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      var r = Snapshot.fromJson(jsonDecode(response.body)['reports']);

      List jsonReportList = List.from(r.asList());
      if (jsonReportList.isNotEmpty) {
        for (int i = 0; i < jsonReportList.length; i++) {
          Report newReport = Patient.createReportFromJson(jsonReportList[i]);
          reportList.add(newReport);
        }
      }
      return Future.value(reportList);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load patient');
    }
  }
}
