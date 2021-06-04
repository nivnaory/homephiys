import 'package:homephiys/Entity/AccessStage.dart';
import 'package:homephiys/Entity/Report.dart';
import 'package:snapshot/snapshot.dart';

import 'Exercise.dart';
import 'Protocol.dart';
import 'Stage.dart';
import 'SubProtocol.dart';
import 'TreatmentType.dart';

class Patient {
  String _username;

  String get username => _username;
  String _firstName;
  String _password;
  TreatmentType _treatmentType;
  List<Report> _reportList;
  List<AccessStage> _accessesStageList;
  List<List<String>> _therapistNote;

  Patient(String userName, String password, String firstName) {
    this._username = userName;
    this._password = password;
    this._firstName = firstName;
    this._accessesStageList = [];
    this._reportList = [];
    this._therapistNote=[];
  }
  String get firstName => _firstName;

  String get password => _password;

  TreatmentType get treatmentType => _treatmentType;

  List<Report> get reportList => _reportList;

  List<AccessStage> get accessesStageList => _accessesStageList;
  List<List<String>> get therapistNote => _therapistNote;

  set password(String value) {
    password = value;
  }

  set firstName(String value) {
    firstName = value;
  }

  set treatmentType(TreatmentType value) {
    _treatmentType = value;
  }
  set therapistNote(List<List<String>> therapistNotes) {
    _therapistNote=therapistNotes;
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
    TreatmentType newTreatment = new TreatmentType(type, treatmentId, currentScore);
    List stageList = jsonTreatmentType.child('stageList').asList();

    for (int j = 0; j < stageList.length; j++) {
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
    List subProtocolLists = jsonProtocol.child('subProtocols').asList();

    for (int i = 0; i < subProtocolLists.length; i++) {
      SubProtocol subProtocol = new SubProtocol(
          subProtocolLists[i]['name'].toString(),
          int.parse(subProtocolLists[i]['level'].toString()));
      List des = subProtocolLists[i]['description'];
      subProtocol.descriptions = (des.cast<String>());
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
  static List<String> getTherapistNotesFromJson(var jsonNotes){

    List<String> notes=[];
    var l = Snapshot.fromJson(jsonNotes['noteForExercise']);
    List notesList = List.from(l.asList());
    for(int i=0;i<notesList.length;i++){
      notes.add(notesList[i].toString());
    }

    return notes;
  }

  //read from json
  factory Patient.fromJson(Map<String, dynamic> json) {

    //create newPaitnet
    Patient newPatient = new Patient(json['username'].toString(),
        json['password'].toString(), json['name'].toString());

    //create treament type
    var treatmentJson = Snapshot.fromJson(json['treatmentType']);
    TreatmentType newTreatmentType = createTreatmentTypeFromJson(treatmentJson);
    newPatient.treatmentType = newTreatmentType;


    //create protocol
     var protocolJson = treatmentJson.child('protocol');
    Protocol newProtocol = createProtocolFromJson(protocolJson);
    newPatient.treatmentType.protocol = (newProtocol);

    //create Access
    var a = Snapshot.fromJson(json['accesses']);
    List accessList = List.from(a.asList());
    for (int i = 0; i < accessList.length; i++) {
      AccessStage newAccess = createAccessFromJson(accessList[i]);
      newPatient.addAccess(newAccess);
    }



    //create reports
    var r = Snapshot.fromJson(json['reports']);
    List reportList = List.from(r.asList());
    if (reportList.isNotEmpty) {
      for (int i = 0; i < reportList.length; i++) {
        Report newReport = createReportFromJson(reportList[i]);
        newPatient.addReport(newReport);
      }
    }

    //creaete TherapistNote
    List<List<String>>therapistNotesList=[];
    var n = Snapshot.fromJson(json['therapistNotes']);
    //print(n);
    List notesList = List.from(n.asList());
    for(int i=0;i<notesList.length;i++){
    List<String> therapistNotes=getTherapistNotesFromJson(notesList[i]);
    print("hello niv"+therapistNotes.toString());
    therapistNotesList.add(therapistNotes);
    }
    newPatient._therapistNote=therapistNotesList;
   // print(newPatient._therapistNote);
    return newPatient;
  }
}
