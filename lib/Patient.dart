class Patient{

  String _firstName;
  String _lastName;
  String _passWord;
  int _patientId;
  //Map _highScore;
  //List _scoreList;
  //Treatment treatment
  //TreatmentType treatmentType
  //Accessing acess

  String get firstName => _firstName;
  String get lastName => _lastName;
  int get patiantId => _patientId;

  String get passWord => _passWord;

  set patiantId(int value) {
    _patientId = value;
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