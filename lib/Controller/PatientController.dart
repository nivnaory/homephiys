import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Entity/Patient.dart';

class PatientController {
  PatientController();

//this function  handel the connection to database
  Future<bool> loginPatient(String username, String password) async {
    final http.Response response = await http.post(
      'http://10.0.2.2:5000/user/login/patient'
     //   'http://172.20.19.56:5000/user/login/patient'
      // 'http://192.168.43.13:5000/user/login/patient'

      ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        /* "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials":
        'true', // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token",
        "Access-Control-Allow-Methods": "POST, OPTIONS"*/
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      print("ok");
      return Future.value(true);
    }

    return Future.value(false);
  }

  Future<Patient> getPatientFromDB(String username) async {
    final response = await http.get(
        'http://10.0.2.2:5000/patient/${username}'
       // 'http://172.20.19.56:5000/patient/${username}'
        //'http://192.168.43.13:5000/patient/${username}'

        );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON

      return Patient.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load patient');
    }
  }

  Future<bool> createPatient(String usernameId, String password, String name,
      String email, int treatmentTypeNumber) async {

    final response = await http.post(
      'http://10.0.2.2:5000/user/register/patient/'
      // 'http://172.20.19.56:5000/user/register/patient/'
      // 'http://192.168.43.13:5000/user/register/patient/'
      ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{
        'username': usernameId,
        'password': password,
        'name': name,
        'email': email,
        'treatmentTypeNumber': treatmentTypeNumber
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      print("ok");
      return Future.value(true);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      return Future.value(true);
    }
  }

  Future<bool> saveHighScore(int highScore, String username, int stageIndex, int exerciseIndex) async {

    final response = await http.put(
      'http://10.0.2.2:5000/patient/${username}/highScore'
      // 'http://172.20.19.56:5000/patient/${userName}/highScore'
      // 'http://192.168.43.13:5000/patient/${userName}/highScore'
      ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{
        "stageIndex":stageIndex,
        "exerciseIndex": exerciseIndex,
        "highScore": highScore,

      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return Future.value(true);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      return Future.value(true);
    }
  }

  Future<bool> setNewNoteForPatient(String username, String newNote,int exerciseIndex,int stageIndex) async {
    print(newNote);
    final response = await http.put(
      'http://10.0.2.2:5000/patient/${username}/updateNote'
      // 'http://172.20.19.56:5000/patient/${username}/updateNote'
      //'http://192.168.43.13:5000/patient/${username}/updateNote'
      ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object>{
        "stageIndex":stageIndex,
        "exerciseIndex":exerciseIndex,
        "note":newNote,
      }),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON

      return Future.value(true);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      return Future.value(false);
    }
  }
}
