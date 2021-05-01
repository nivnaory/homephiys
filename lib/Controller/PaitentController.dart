import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Entity/Paitent.dart';


class PaitentController {
  PaitentController();

//this function  handel the connection to database
  Future<bool> loginPaitent(String username, String password) async {
    final http.Response response = await http.post(
      'http://10.0.2.2:5000/user/login/paitent'
    //  'http://192.168.1.28:5000/user/login/paitent'
     // 'http://192.168.43.13:5000/user/login/paitent'

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

  Future<Paitent> getPaitentFromDB(String username) async {
    final response = await http.get(
        'http://10.0.2.2:5000/paitent/${username}'
        //'http://192.168.1.28:5000/paitent/${username}'
        //'http://192.168.43.13:5000/paitent/${username}'

    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON

      return Paitent.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Paitent');
    }
  }

  Future<bool> createPatient(String usernameId,String password,String name,String email,int treatmentTypeNumber) async {
    print("niv the dick");
    final response = await http.post(
      'http://10.0.2.2:5000/user/register/paitent/'
      // 'http://192.168.1.28:5000/user/register/paitent/'
     // 'http://192.168.43.13:5000/user/register/paitent/'
      ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object> {
        'username':usernameId,
        'password':password,
        'name': name,
        'email':email,
        'treatmentTypeNumber': treatmentTypeNumber

      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON
      return Future.value(true);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      throw Exception('Failed to load Paitent');
    }
  }
}