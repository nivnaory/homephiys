import 'dart:convert';

import 'package:http/http.dart' as http;
class AccessController {

  Future<bool> updateAccess(int stageLevel,int exerciseLevel,String username, bool
  isFinished) async {
    print(username);
    final response = await http.put(
       'http://10.0.2.2:5000/patient/${username}/accesses'
     //'http://172.20.19.56:5000/patient/${username}/accesses'
       //'http://192.168.43.13:5000/patient/${username}/accesses'
    ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, Object> {

      'stageLevel':stageLevel,
      'exerciseLevel':exerciseLevel,
      'isFinished': isFinished,

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
      throw Exception('Failed to load patient');
    }
  }
}