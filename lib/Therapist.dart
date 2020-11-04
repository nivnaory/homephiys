class Therapist{

  String _userName;
  String _passWord;
  int _therapistId;
  //Patient patient


  String get userName => _userName;
  int get therapistId => _therapistId;
  String get passWord => _passWord;

  set therapistId(int value) {
    _therapistId = value;
  }

  set passWord(String value) {
    _passWord = value;
  }

  set userName(String value) {
    _userName = value;
  }



}