class Therapist {
  String _userName;
  String _name;
  int _therapistId;

  Therapist(String username,String name){
    this._userName=username;
    this._name=name;
  }
  String get userName => _userName;

  int get therapistId => _therapistId;

  String get name => _name;

  set therapistId(int value) {
    _therapistId = value;
  }

  set passWord(String value) {
    _name = value;
  }

  set userName(String value) {
    _userName = value;
  }


  //read from json
  factory Therapist.fromJson(Map<String, dynamic> json) {
    try {
      Therapist newTherapist = new Therapist(json['username'].toString(),
          json['name'].toString());
      return newTherapist;
    }catch (e) {
      return null;
    }
  }
}

