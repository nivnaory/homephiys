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

  //Treatment treatment
  //Accessing acess

  Paitent(String userName, String password, String firstName) {
    this._username = userName;
    this._password = password;
    this._firstName = firstName;
    this._treatmentType = new List();
  }

  String get getFirstName => this._firstName;
  String get getPassWord => this._password;
  String get getUserName => this._username;
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

  void addTreatmentype(TreatmentType newTreatmentType) {
    this._treatmentType.add(newTreatmentType);
  }
/*
  //create Paitent
  factory Paitent.fromJson(Map<String, dynamic> json) {
    Paitent newPaitent = new Paitent(json['username'].toString(),
        json['password'].toString(), json['name'].toString());
    var v = Snapshot.fromJson(json['treatmentType']);
    List treatmentTypeList = List.from(v.asList());

    for (int i = 0; i < treatmentTypeList.length; i++) {
    
      TreatmentType newTreatment = new TreatmentType(
          treatmentTypeList[i]['type'].toString(),
          int.parse(treatmentTypeList[i]['treatmentId'].toString()));

      List stageList = List.from(treatmentTypeList[i]['stageList']);
      for (int j = 0; j < stageList.length; j++) {
        Stage newStage =
            new Stage(int.parse(stageList[j]['currentLevel'].toString()));

        List exerciseList = List.from(stageList[j]['exerciseList']);
        for (int k = 0; k < exerciseList.length; k++) {
          Exercise newExercise = new Exercise(
              exerciseList[k]['name'].toString(),
              exerciseList[k]['description'].toString(),
              int.parse(exerciseList[k]['level'].toString()),
              int.parse(exerciseList[k]['exerciseId'].toString()));
          newStage.addExercise(newExercise);
        }
        newTreatment.addNewStage(newStage);
      }
      newPaitent.addTreatmentype(newTreatment);
    }

    var p = Snapshot.fromJson(json['protocol']);
    String name = p.child('name').as<String>();
    int protocolId = p.child('protocolId').as<int>();
    Protocol protocol = new Protocol(name, protocolId);
    List subProtocolLits = p.child('subProtocols').asList();

    for (int i = 0; i < subProtocolLits.length; i++) {
      SubProtocol subProtocol = new SubProtocol(
          subProtocolLits[i]['name'].toString(),
          int.parse(subProtocolLits[i]['level'].toString()));
      List des = subProtocolLits[i]['description'];
      subProtocol.setDescriptions(des.cast<String>());
      protocol.addSubProtocol(subProtocol);
    }
    newPaitent.SetProtocol(protocol);
    return newPaitent;
  }
}
*/

  static TreatmentType createTreatmentTypeFromJson(var jsonTreatmentType) {
    TreatmentType newTreatment = new TreatmentType(
        jsonTreatmentType['type'].toString(),
        int.parse(jsonTreatmentType['treatmentId'].toString()));

    List stageList = List.from(jsonTreatmentType['stageList']);
    for (int j = 0; j < stageList.length; j++) {
      Stage newStage =
          new Stage(int.parse(stageList[j]['currentLevel'].toString()));

      List exerciseList = List.from(stageList[j]['exerciseList']);
      for (int k = 0; k < exerciseList.length; k++) {
        Exercise newExercise = new Exercise(
            exerciseList[k]['name'].toString(),
            exerciseList[k]['description'].toString(),
            int.parse(exerciseList[k]['level'].toString()),
            int.parse(exerciseList[k]['exerciseId'].toString()));
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

    var porotocolJson = Snapshot.fromJson(json['protocol']);
    Protocol newProtocol = createProtocolFromJson(porotocolJson);
    newPaitent.SetProtocol(newProtocol);
    return newPaitent;
  }
}
