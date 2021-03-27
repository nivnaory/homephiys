import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  List<TreatmentType> _treatmentType;
  Protocol _protocol;
  List <Report>_reports;
  List<AccessStage> _accessesStageList;




  Paitent(String userName, String password, String firstName) {
    this._username = userName;
    this._password = password;
    this._firstName = firstName;
    this._treatmentType = new List();
    this._accessesStageList=[];
  }

  String get getFirstName => this._firstName;
  String get getPassWord => this._password;
  String get getUserName => this._username;
  List<AccessStage> get accessesStageList => _accessesStageList;
  List<Report> get reports => _reports;


  List<TreatmentType> get getTreatmentType => _treatmentType;
  Protocol get getProtocol => _protocol;
  set password(String value) {
    password = value;
  }

  set firstName(String value) {
    firstName = value;
  }

  set treatmentType(List<TreatmentType> value) {
    _treatmentType = value;
  }

  void SetProtocol(Protocol value) {
    _protocol = value;
  }

  set reports(List<Report> value) {
    _reports = value;
  } //Treatment treatment


  void addAccess(AccessStage access){
    this._accessesStageList.add(access);
  }
  void addTreatmentype(TreatmentType newTreatmentType) {
    this._treatmentType.add(newTreatmentType);
  }


  static TreatmentType createTreatmentTypeFromJson(var jsonTreatmentType) {


    TreatmentType newTreatment = new TreatmentType(
        jsonTreatmentType['type'].toString(),
        int.parse(jsonTreatmentType['treatmentId'].toString()),
            int.parse(jsonTreatmentType['currentScore'].toString()));

    List stageList = List.from(jsonTreatmentType['stageList']);
    for (int j = 0; j < stageList.length; j++) {

      print(stageList[j]['currentScore'].toString());
      Stage newStage =
          new Stage(int.parse(stageList[j]['currentLevel'].toString()),
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

  static AccessStage createAccessFromjson(var jsonAccess){
    bool stageBool =jsonAccess['stageBool'];

    List<bool> exerciseBoolList=List.from(jsonAccess['exerciseBool']);
    for (int i =0;i<exerciseBoolList.length;i++){

    }
    AccessStage  newStageAccess=new AccessStage(stageBool,exerciseBoolList);

    return newStageAccess;
  }

  //read from json
  factory Paitent.fromJson(Map<String, dynamic> json) {
    Paitent newPaitent = new Paitent(json['username'].toString(),
        json['password'].toString(), json['name'].toString());
    var v = Snapshot.fromJson(json['treatmentType']);

    //create treaement type
    List treatmentTypeList = List.from(v.asList());
    for (int i = 0; i < treatmentTypeList.length; i++) {
      TreatmentType newTreatmentType = createTreatmentTypeFromJson(treatmentTypeList[i]);
      newPaitent.addTreatmentype(newTreatmentType);
    }
    //create protocol
    var porotocolJson = Snapshot.fromJson(json['protocol']);
    Protocol newProtocol = createProtocolFromJson(porotocolJson);
    newPaitent.SetProtocol(newProtocol);


    //create Access
    var a= Snapshot.fromJson(json['access']);
    List accessList = List.from(a.asList());
    for(int i=0;i<accessList.length;i++) {
      AccessStage newAccess = createAccessFromjson(accessList[i]);
       newPaitent.addAccess(newAccess);
    }
    //if(newPaintent.report isnot empty)
    //here add createReportFunctions;
    return newPaitent;
  }
}
