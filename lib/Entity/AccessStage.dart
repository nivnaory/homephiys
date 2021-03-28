class AccessStage{
  bool _stageAccess;


  List<bool> _exerciseAccess;



  AccessStage(bool stageAccess,List<bool> exerciseBoolList){

    this._stageAccess=stageAccess;
    this._exerciseAccess=exerciseBoolList;
  }
  bool get stageAccess => _stageAccess;
  List<bool> get exerciseAccess => _exerciseAccess;

  set exerciseAccess(List<bool> value) {
    _exerciseAccess = value;
  }
  set stageAccess(bool value) {
    _stageAccess = value;
  }

}