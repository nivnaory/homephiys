import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Paitent.dart';
//this function  handel the connection to database


class PaitentController {
  PaitentController();

  Future<bool> loginPaitent(String username, String password) async {
    final http.Response response = await http.post(
      'http://10.0.2.2:5000/user/login/paitent',
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

  Future<Paitent> getPaitentFromDB(String username) async {
    final response = await http.get('http://10.0.2.2:5000/paitent/${username}');
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
}