import 'package:homephiys/Stage.dart';

class TreatmentType{
  String _type;
  int _treatmenId;
  List<Stage> _stageList;

  TreatmentType(String type,int treatmentId){
    this._type=type;
    this._treatmenId=treatmentId;
    this._stageList=new List();
  }
  int get getTreatmenId => _treatmenId;
  String get getType => _type;
  List<Stage> get getStageList => _stageList;




  set setTreatmenId(int value) {
    _treatmenId = value;
  }
  set setType(String value) {
    _type = value;
  }
  set setStageList(List<Stage> value) {
    _stageList = value;
  }

  void addNewStage(Stage newStage){
    this._stageList.add(newStage);
  }

}