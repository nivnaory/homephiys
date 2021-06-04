import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "יצירת קשר",
            style: TextStyle(color: Colors.black),
          ),
        ),
      body: Column(
          children: <Widget>[
                   Container(
          padding: EdgeInsets.fromLTRB(10.0, 150.0, 10.0, 50.0),
                    child: Text(
                       "לתמיכה טכנית, יש לפנות למנהלי המערכת  בכתובת האימייל: help@homephys.com  או בטלפון:03-5753636",
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
                "לתמיכה בטיפולי הפיזיותרפיה, יש לפנות לבית החולים בטלפון:09-747-2555 או בכתובת האימייל: physio@meir-hospital.com  ",
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
