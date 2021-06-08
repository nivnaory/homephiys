import 'dart:convert';
import 'package:homephiys/Entity/Patient.dart';
import 'package:homephiys/Entity/Therapist.dart';
import 'package:http/http.dart' as http;

class TherapistCotroller {
  TherapistCotroller();

//this function  handel the connection to database
  Future<bool> loginTherapist(String username, String password) async {
    print(username);
    print(password);
    final http.Response response = await http.post(
      'http://10.0.2.2:5000/user/login/therapist'
     //   'http://172.20.19.56:5000/user/login/therapist'
      // 'http://192.168.43.13:5000/user/login/therapist'
      ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
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

  Future<Therapist> getTherapistFromDB(String username) async {
    final response = await http.get('http://10.0.2.2:5000/therapist/${username}'
      //final response = await http.get('http://172.20.19.56:5000/therapist/${username}'
      //final response = await http.get('http://192.168.43.13:5000/therapist/${username}'


        );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON

      return Therapist.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      return null;
    }
  }

  Future<bool> setNewPassword(String username, String newPassword) async {
    print(newPassword.toString());
    final response = await http.put(
      'http://10.0.2.2:5000/therapist/${username}/password'
     // 'http://172.20.19.56:5000/therapist/${username}'
      //'http://192.168.43.13:5000/therapist/${username}''
      ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'password': newPassword,
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

  Future<List<Patient>> getAllPatientsFromDB(String username) async {
    final response =
        await http.get('http://10.0.2.2:5000/therapist/${username}/allPatient'
        //  await http.get('http://172.20.19.56:5000/therapist/${username}/allPatient'
          // await http.get('http://192.168.43.13:5000/therapist/${username}/allPatient'


            );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      List<Patient> patients = [];
      //print(response.body);
      List<dynamic>list=jsonDecode(response.body);
     for ( dynamic value in list){
       patients.add(Patient.fromJson(value));
     }


      return patients;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load patient');
    }
  }


}
