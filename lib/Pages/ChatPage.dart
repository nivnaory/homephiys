import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
                   Container(
          padding: EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 50.0),
                    child: Text(
                       "לתמיכה טכנית, יש לפנות לניב נאורי , אימייל: naoryniv@gmail.com ",
                    style: TextStyle(
                        fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times New Roman'),
                      textDirection: TextDirection.rtl,
      ),

    ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 50.0),
                    child: Text(
                "לתמיכה בטיפולי הפיזיותרפיה, יש לפנות לבית החולים  ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman'),
                      textDirection: TextDirection.rtl,
              ),

            ),

    ]));

  }

}
