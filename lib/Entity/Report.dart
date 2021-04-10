class Report {
  int _stageLevel;
  int _exerciseLevel;
  List<String> _questions;
  List<int> _answers;
  String _openAnswers;
  int _scores;

  Report(int stageLevel, int exerciseLevel, List<String> questions,
      List<int> answers, String openAnswer, int score) {
    this._stageLevel = stageLevel;
    this._exerciseLevel = exerciseLevel;
    this._questions = questions;
    this.answers = answers;
    this._openAnswers = openAnswer;
    this._scores = score;
  }

  set scores(int value) {
    _scores = value;
  }

  set openAnswers(String value) {
    _openAnswers = value;
  }

  set answers(List<int> value) {
    _answers = value;
  }

  set questions(List<String> value) {
    _questions = value;
  }

  set exerciseLevel(int value) {
    _exerciseLevel = value;
  }

  set stageLevel(int value) {
    _stageLevel = value;
  }

  int get exerciseLevel => _exerciseLevel;

  List<String> get questions => _questions;

  List<int> get answers => _answers;

  String get openAnswers => _openAnswers;

  int get scores => _scores;

  int get stageLevel => _stageLevel;
}
