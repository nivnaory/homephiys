import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Controller/PaitentController.dart';
import 'package:toast/toast.dart';

class PhsiotherapistRegistrationPage extends StatelessWidget {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final userNameId = TextEditingController();
  PaitentController paitentController = new PaitentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
              child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                child: Text(
                  ":הרשמה",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster'),
                ),
              )
            ],
          )),
          Container(
            padding: EdgeInsets.only(top: 55.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  obscureText: false,
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: ':שם פרטי',
                  ),
                ),
                SizedBox(height: 25.0),
                TextField(
                  obscureText: false,
                  controller: userNameId,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: ':ת.ז',
                  ),
                ),
                SizedBox(height: 25.0),
                TextField(
                  obscureText: false,
                  controller: password,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: ':סיסמא',
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  obscureText: false,
                  controller: confirmPassword,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: ':אימות סיסמא',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: 50.0,
            child: Material(
              borderRadius: BorderRadius.circular(200.0),
              shadowColor: Colors.greenAccent,
              color: Colors.green,
              elevation: 7.0,
              child: GestureDetector(
                onTap: () {
                  //go to threpyist homepage
                },
                child: Center(
                  child: Text(
                    " :אישור והמשך",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: 'IndieFlower'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String validateEmail(String value, build, BuildContext context) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      Toast.show("האימייל לא הוזן כראוי, אנא בדוק זאת", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      return "";
    } else {
      return value;
    }
  }
}
