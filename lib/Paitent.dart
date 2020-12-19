class Paitent {
  String _username;
  String _firstName;
  String _password;

//  int _patientId;
  //Map _highScore;
  //List _scoreList;
  //Treatment treatment
  //TreatmentType treatmentType
  //Accessing acess


  Paitent(String userName,String password,String firstName) {
    this._username=userName;
    this._password=password;
    this._firstName=firstName;
  }

   String get getFirstName => this._firstName;
   String get getPassWord => this._password;
   String get getUserName => this._username;

  set password(String value) {
    password = value;
  }


  set firstName(String value) {
    firstName = value;
  }

  factory Paitent.fromJson(Map<String, dynamic> json) {
    return Paitent(json['username'].toString(),json['password'].toString(),json['name'].toString());
  }
}

