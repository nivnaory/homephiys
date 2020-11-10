class Patient{

  String _firstName;
  String _lastName;
  String _passWord;
  Map _highScore;
  List _scoreList;
  int _patientId;
  //Treatment treatment
  //TreatmentType treatmentType
  //Accessing acess

  String get firstName => _firstName;
  String get lastName => _lastName;
  int get patiantId => _patientId;
  List get scoreList => _scoreList;
  Map get highScore => _highScore;
  String get passWord => _passWord;

  set patiantId(int value) {
    _patientId = value;
  }

  set scoreList(List value) {
    _scoreList = value;
  }

  set highScore(Map value) {
    _highScore = value;
  }


  set passWord(String value) {
    _passWord = value;
  }


  set lastName(String value) {
    _lastName = value;
  }

  set firstName(String value) {
    _firstName = value;
  }





}