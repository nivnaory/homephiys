import 'package:homephiys/Exercise.dart';

class Stage{
 int _currentLevel;
 List<Exercise> _exerciseList;


  Stage(int currentLevel){
    this._currentLevel=currentLevel;
    this._exerciseList=new List();
  }



 int get getCurrentLevel => _currentLevel;
 List<Exercise> get getExerciseList => _exerciseList;

  set setExerciseList(List<Exercise> value) {
    _exerciseList = value;
  }
 set setCurrentLevel(int value) {
   _currentLevel = value;
 }
 void addExercise(Exercise newExercise){
    this._exerciseList.add(newExercise);
 }
}