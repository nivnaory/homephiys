import 'package:homephiys/Entity/Exercise.dart';

class Stage {
  int _currentLevel;
  List<Exercise> _exerciseList;



  List<Exercise> get exerciseList => _exerciseList;
  int get currentLevel => _currentLevel;

  Stage(int currentLevel) {
    this._currentLevel = currentLevel;
    this._exerciseList = new List();

  }



  set setExerciseList(List<Exercise> value) {
    _exerciseList = value;
  }

  set setCurrentLevel(int value) {
    _currentLevel = value;
  }

  void addExercise(Exercise newExercise) {
    this._exerciseList.add(newExercise);
  }

}
