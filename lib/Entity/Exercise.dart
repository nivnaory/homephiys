class Exercise {
  String _name;
  String _description;

  String get name => _name;
  int _level;
  List<String> _questions;
  int _exerciseId;


  Exercise(String name, String description, int level, int exerciseId) {
    this._name = name;
    this._description = description;
    this._level = level;
    this._exerciseId = exerciseId;
    this._questions = [];
  }

  set setDescription(String value) {
    _description = value;
  }

  set setLevel(int value) {
    _level = value;
  }

  set setQuestions(List<String> value) {
    _questions = value;
  }

  void addQuestion(String newQuestion) {
    this._questions.add(newQuestion);
  }

  String get description => _description;

  int get level => _level;

  List<String> get questions => _questions;

  int get exerciseId => _exerciseId;
}
