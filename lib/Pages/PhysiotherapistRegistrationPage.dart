import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Controller/PatientController.dart';
import 'package:homephiys/Controller/TherapistController.dart';
import 'package:homephiys/Entity/Therapist.dart';
import 'package:toast/toast.dart';

import 'PhysiotherapistNewPassword.dart';

class PhysiotherapistRegistrationPage extends StatelessWidget {
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  TherapistCotroller therapistCotroller = new TherapistCotroller();

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
                  ":הזן מספר הזדהות במערכת ",
                  style: TextStyle(
                      fontSize: 30,
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
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: ':תעוזת זהות',
                  ),
                ),
                SizedBox(height: 30.0),

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
                  Future<Therapist> fatchTherapist =
                  therapistCotroller.getTherapistFromDB(username.text.trim());
                  fatchTherapist.then((therapist) {
                    if(therapist!=null){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhysiotherapistNewPassword(username:username.text)));
                    }else{

                      Toast.show("therapist is not recognize", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                    }
                  });
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
