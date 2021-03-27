import 'package:homephiys/Entity/Exercise.dart';

class Stage{
 int _currentLevel;
 List<Exercise> _exerciseList;
  int _currentScore;



 Stage(int currentLevel, int currentScore){
    this._currentLevel=currentLevel;
    this._exerciseList=new List();
    this._currentScore = currentScore;
  }



 int get getCurrentLevel => _currentLevel;
 List<Exercise> get getExerciseList => _exerciseList;
 int get currentScore => _currentScore;

  set setExerciseList(List<Exercise> value) {
    _exerciseList = value;
  }
 set setCurrentLevel(int value) {
   _currentLevel = value;
 }
 void addExercise(Exercise newExercise){
    this._exerciseList.add(newExercise);

 }
 set currentScore(int value) {
   _currentScore = value;
 }

}