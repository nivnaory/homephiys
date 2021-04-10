import 'package:homephiys/Entity/Stage.dart';

import 'Protocol.dart';

class TreatmentType {
  String _type;

  String get type => _type;
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
  int get treatmenId => _treatmenId;

  List<Stage> get stageList => _stageList;

  int get currentScore => _currentScore;

  Protocol get protocol => _protocol;

  set setTreatmenId(int value) {
    _treatmenId = value;
  }

  set setType(String value) {
    _type = value;
  }

  set setStageList(List<Stage> value) {
    _stageList = value;
  }

  set protocol(Protocol value) {
    _protocol = value;
  }

  void addNewStage(Stage newStage) {
    this._stageList.add(newStage);
  }

  set currentScore(int value) {
    _currentScore = value;
  }


}
