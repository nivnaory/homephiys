import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Controller/TherapistController.dart';
import 'package:toast/toast.dart';

import 'PhysiotherapistLoginPage.dart';



class PhysiotherapistNewPassword extends StatelessWidget {

  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final String username;
  final TherapistCotroller therapistController=new TherapistCotroller();
  PhysiotherapistNewPassword({this.username});
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
                      "יצירת סיסמא חדשה  ",
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
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'הכנס סיסמא חדשה',
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  obscureText: false,
                  controller: confirmPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'אימות סיסמא חדשה',
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
                  if (password.text == confirmPassword.text) {
                Future<bool> fatchNewPassword =
                therapistController.setNewPassword(username.trim(),password.text.trim());
                 fatchNewPassword.then((change_password) {
                    //put
                      if(change_password){
                        Toast.show("password changed", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhysiotherapistLoginPage()));
                      }
                  });
                  }
                },
                child: Center(
                  child: Text(
                    " :אישור הסיסמא",
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
}
