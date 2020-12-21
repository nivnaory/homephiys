import 'package:flutter/material.dart';
import 'package:homephiys/Exercise.dart';
import 'package:homephiys/TreatmentType.dart';
import 'package:snapshot/snapshot.dart';
import 'Stage.dart';

class Paitent {
  String _username;
  String _firstName;
  String _password;
  List<TreatmentType> _treatmentType;

  //Map _highScore;
  //List _scoreList;
  //Treatment treatment
  //Accessing acess


  Paitent(String userName,String password,String firstName) {
    this._username=userName;
    this._password=password;
    this._firstName=firstName;
    this._treatmentType=new List();
  }

   String get getFirstName => this._firstName;
   String get getPassWord => this._password;
   String get getUserName => this._username;
   List<TreatmentType> get getTreatmentType => _treatmentType;

  set password(String value) {
    password = value;
  }


  set firstName(String value) {
    firstName = value;
  }

  set treatmentType(List<TreatmentType> value) {
    _treatmentType = value;
  } //  int _patientId;
  void addTreatmentype(TreatmentType newTreatmentType){
    this._treatmentType.add(newTreatmentType);
  }

  factory Paitent.fromJson(Map<String, dynamic> json) {
      //create Paitent
      Paitent newPaitent=new Paitent(
          json['username'].toString(),
          json['password'].toString(),
          json['name'].toString());
      var v = Snapshot.fromJson(json['treatmentType']);
      List treatmentTypeList=List.from(v.asList());
      for (int i=0;i<treatmentTypeList.length;i++){
        TreatmentType newTreatment=new TreatmentType(
            treatmentTypeList[i]['type'].toString(),
            int.parse(treatmentTypeList[i]['treatmentId'].toString()));

        List stageList= List.from(treatmentTypeList[i]['stageList']);
        for(int j =0;j<stageList.length;j++){
           Stage newStage=new Stage(
              int.parse(stageList[j]['currentLevel'].toString()));

          List exerciseList=List.from(stageList[j]['exerciseList']);
          for(int k=0;k<exerciseList.length;k++){
            Exercise newExercise=new Exercise(
                exerciseList[k]['name'].toString(),
                exerciseList[k]['description'].toString(),
                int.parse(exerciseList[k]['level'].toString()),
                 int.parse(exerciseList[k]['exerciseId'].toString()));
                newStage.addExercise(newExercise);
          }
          newTreatment.addNewStage(newStage);
        }
         newPaitent.addTreatmentype(newTreatment);
      }
      return newPaitent;
  }

}

