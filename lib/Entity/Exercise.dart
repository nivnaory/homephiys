class Exercise{
String _name;
String _description;
  int _level;
  List<String> _questions;
  int _exerciseId;

  List<String> get getQuestions => _questions;
  String get getDescription => _description;
  int get getLevel => _level;
  int get getExerciseId => _exerciseId;


  Exercise(String name,String description,int level, int exerciseId){
    this._name=name;
    this._description=description;
    this._level=level;
    this._exerciseId=exerciseId;
    this._questions=[];
   // need to handle the array of question!
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
     void addQuestion(String newQuestion){
       this._questions.add(newQuestion);
     }
  }