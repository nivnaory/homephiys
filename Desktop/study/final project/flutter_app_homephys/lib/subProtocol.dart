class SubProtocol {
  String _name;
  int _level;
  List<String> _descriptions;


  SubProtocol(String name, int level) {
    this._name = name;
    this._level = level;
    this._descriptions = [];
  }

  List<String> get descriptions => _descriptions;

  String get name => _name;

  int get level => _level;

  void setDescriptions(List<String> value) {
    _descriptions = value;
  }
}
