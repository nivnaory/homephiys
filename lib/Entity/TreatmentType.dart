import 'package:homephiys/Entity/Stage.dart';

import 'Protocol.dart';

class TreatmentType {
  String _type;
  int _treatmenId;
  List<Stage> _stageList;
  int _currentScore;
  Protocol _protocol;

  TreatmentType(String type, int treatmentId, int currentScore) {
    this._type = type;
    this._treatmenId = treatmentId;
    this._stageList = new List();
    this._currentScore = currentScore;
  }
  int get getTreatmenId => _treatmenId;
  String get getType => _type;
  List<Stage> get getStageList => _stageList;
  int get currentScore => _currentScore;
  Protocol get getProtocol => _protocol;

  set setTreatmenId(int value) {
    _treatmenId = value;
  }

  set setType(String value) {
    _type = value;
  }

  set setStageList(List<Stage> value) {
    _stageList = value;
  }

  void SetProtocol(Protocol value) {
    _protocol = value;
  }

  void addNewStage(Stage newStage) {
    this._stageList.add(newStage);
  }

  set currentScore(int value) {
    _currentScore = value;
  }
}
