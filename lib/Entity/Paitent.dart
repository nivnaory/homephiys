import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Controller/ReportController.dart';
import 'package:homephiys/Entity/AccessStage.dart';
import 'package:homephiys/Entity/Report.dart';
import 'package:snapshot/snapshot.dart';
import 'Exercise.dart';
import 'Protocol.dart';
import 'Stage.dart';
import 'SubProtocol.dart';
import 'TreatmentType.dart';

class Paitent {
  String _username;
  String _firstName;
  String _password;
  TreatmentType _treatmentType;
  List<Report> _reportList;
  List<AccessStage> _accessesStageList;

  Paitent(String userName, String password, String firstName) {
    this._username = userName;
    this._password = password;
    this._firstName = firstName;
    this._accessesStageList = [];
    this._reportList = [];
  }

  String get getFirstName => this._firstName;
  String get getPassWord => this._password;
  String get getUserName => this._username;
  List<AccessStage> get accessesStageList => _accessesStageList;
  List<Report> get getReports => _reportList;
  TreatmentType get getTreatmentType => _treatmentType;

  set password(String value) {
    password = value;
  }

  set firstName(String value) {
    firstName = value;
  }

  void SetTreatmentType(TreatmentType value) {
    _treatmentType = value;
  }

  void addReport(Report report) {
    this._reportList.add(report);
  }

  void addAccess(AccessStage access) {
    this._accessesStageList.add(access);
  }

  static TreatmentType createTreatmentTypeFromJson(var jsonTreatmentType) {
    String type = jsonTreatmentType.child('type').as<String>();
    int treatmentId = jsonTreatmentType.child('treatmentId').as<int>();
    int currentScore = jsonTreatmentType.child('currentScore').as<int>();
    TreatmentType newTreatment = new TreatmentType(
        type, treatmentId, currentScore
        /*    jsonTreatmentType['type'].toString(),
        int.parse(jsonTreatmentType['treatmentId'].toString()),
        int.parse(jsonTreatmentType['currentScore'].toString())*/
        );
    List stageList = jsonTreatmentType.child('stageList').asList();

    for (int j = 0; j < stageList.length; j++) {
      print(stageList[j]['currentScore'].toString());
      Stage newStage = new Stage(
          int.parse(stageList[j]['currentLevel'].toString()),
          int.parse(stageList[j]['currentScore'].toString()));

      List exerciseList = List.from(stageList[j]['exerciseList']);
      for (int k = 0; k < exerciseList.length; k++) {
        Exercise newExercise = new Exercise(
            exerciseList[k]['name'].toString(),
            exerciseList[k]['description'].toString(),
            int.parse(exerciseList[k]['level'].toString()),
            int.parse(exerciseList[k]['exerciseId'].toString()));
        List questions_list = List.from(exerciseList[k]['questions']);
        for (int i = 0; i < questions_list.length; i++) {
          newExercise.addQuestion(questions_list[i]);
        }

        newStage.addExercise(newExercise);
      }
      newTreatment.addNewStage(newStage);
    }
    return newTreatment;
  }

  static Protocol createProtocolFromJson(var jsonProtocol) {
    String name = jsonProtocol.child('name').as<String>();
    int protocolId = jsonProtocol.child('protocolId').as<int>();
    Protocol protocol = new Protocol(name, protocolId);
    List subProtocolLits = jsonProtocol.child('subProtocols').asList();

    for (int i = 0; i < subProtocolLits.length; i++) {
      SubProtocol subProtocol = new SubProtocol(
          subProtocolLits[i]['name'].toString(),
          int.parse(subProtocolLits[i]['level'].toString()));
      List des = subProtocolLits[i]['description'];
      subProtocol.setDescriptions(des.cast<String>());
      protocol.addSubProtocol(subProtocol);
    }

    return protocol;
  }

  static AccessStage createAccessFromJson(var jsonAccess) {
    bool stageBool = jsonAccess['stageBool'];

    List<bool> exerciseBoolList = List.from(jsonAccess['exerciseBool']);
    AccessStage newStageAccess = new AccessStage(stageBool, exerciseBoolList);

    return newStageAccess;
  }

  static Report createReportFromJson(var jsonReport) {
    int stageLevel = jsonReport['stageLevel'];

    int exerciseLevel = jsonReport['exerciseLevel'];

    String openAnswer = jsonReport['openAnswer'];

    List<int> answers = List.from(jsonReport['answers']);
    List<String> questions = List.from(jsonReport['questions']);
    int score = jsonReport['score'];

    Report newReport = new Report(
        stageLevel, exerciseLevel, questions, answers, openAnswer, score);

    return newReport;
  }

  //read from json
  factory Paitent.fromJson(Map<String, dynamic> json) {
    //create newPaitnet
    Paitent newPaitent = new Paitent(json['username'].toString(),
        json['password'].toString(), json['name'].toString());

    //create treament type
    var treatmentJson = Snapshot.fromJson(json['treatmentType']);
    TreatmentType newTreatmentType = createTreatmentTypeFromJson(treatmentJson);
    newPaitent.SetTreatmentType(newTreatmentType);

    //create protocol
    // print(json);
    var porotocolJson = Snapshot.fromJson(json['protocol']);
    Protocol newProtocol = createProtocolFromJson(porotocolJson);
    newPaitent.getTreatmentType.SetProtocol(newProtocol);

    //create Access
    var a = Snapshot.fromJson(json['accesses']);
    List accessList = List.from(a.asList());
    for (int i = 0; i < accessList.length; i++) {
      AccessStage newAccess = createAccessFromJson(accessList[i]);
      newPaitent.addAccess(newAccess);
    }

    var r = Snapshot.fromJson(json['reports']);

    List reportList = List.from(r.asList());
    print(reportList.toString());
    if (reportList.isNotEmpty) {
      for (int i = 0; i < reportList.length; i++) {
        Report newReport = createReportFromJson(reportList[i]);
        newPaitent.addReport(newReport);
      }
      ;
    }

    //here add createReportFunctions;
    //on the treatment progress page
    return newPaitent;
  }
}
