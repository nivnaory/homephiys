class Doctor{

  String _userName;
  String _passWord;
  int _doctorId;
  //Patient patient
  //TreatmentType treatmentType
  String get userName => _userName;
  int get doctorId => _doctorId;
  String get passWord => _passWord;

  set doctorId(int value) {
    _doctorId = value;
  }

  set passWord(String value) {
    _passWord = value;
  }

  set userName(String value) {
    _userName = value;
  }

}