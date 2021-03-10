import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Controller/PaitentController.dart';
import 'package:homephiys/Controller/ReportController.dart';
import 'package:homephiys/Entity/Paitent.dart';
import 'package:toast/toast.dart';
import 'ForgetPasswordPage.dart';
import 'PatientHomePage.dart';



class LoginScreen extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();
  PaitentController paitentController=new PaitentController();
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
                    padding: EdgeInsets.fromLTRB(10.0, 150.0, 0.0, 50.0),
                    child: Text(
                      "homePhys",
                      style: TextStyle(
                          fontSize: 70,
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
                    hintText: 'Ex:id:123456789',
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'Password  ',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          FlatButton(
            onPressed: () => {
              print("Forgot Password"),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgetPasswordPage(username: username)),
              ),
            },
            color: Colors.white10,
            padding: EdgeInsets.all(0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              // Replace with a Row for horizontal icon + text
              children: <Widget>[
                Text("Forgot Password",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: 50.0,
            child: Material(
              borderRadius: BorderRadius.circular(200.0),
              shadowColor: Colors.greenAccent,
              color: Colors.green,
              elevation: 7.0,
              child: GestureDetector (
                onTap: () {
                    Future f = paitentController.loginPaitent(username.text, password.text);
                    f.then((value) {
                      if (value == true) {
                        Future <Paitent> fatchPaitent=paitentController.getPaitentFromDB(username.text);
                        fatchPaitent.then((paitent){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PatientHomePage(paitent:paitent)));
                        });
                      } else {
                        Toast.show("Login Failed", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      }
                    });
                },
                child: Center(
                  child: Text(
                    "Login",
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


/*
class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  PaitentController paitentController=new PaitentController();

  /*
  create 2 attaribute of text field

  one for the email and one for the password
   */

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
                padding: EdgeInsets.fromLTRB(10.0, 150.0, 0.0, 50.0),
                child: Text(
                  "homePhys",
                  style: TextStyle(
                      fontSize: 70,
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
                    hintText: 'Ex:id:123456789',
                  ),
                ),
                SizedBox(height: 30.0),
                TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'Password  ',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          FlatButton(
            onPressed: () => {
              print("Forgot Password"),
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgetPasswordPage(username: username)),
              ),
            },
            color: Colors.white10,
            padding: EdgeInsets.all(0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              // Replace with a Row for horizontal icon + text
              children: <Widget>[
                Text("Forgot Password",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: 50.0,
            child: Material(
              borderRadius: BorderRadius.circular(200.0),
              shadowColor: Colors.greenAccent,
              color: Colors.green,
              elevation: 7.0,
              child: GestureDetector (
                onTap: () {
                  setState(() {
                    Future f = paitentController.loginPaitent(username.text, password.text);
                    f.then((value) {
                      print(value);
                      if (value == true) {
                       Future <Paitent> fatchPaitent=paitentController.getPaitentFromDB(username.text);
                       fatchPaitent.then((paitent){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PatientHomePage(paitent:paitent,)));
                       });
                      } else {
                        Toast.show("Login Failed", context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      }
                    });
                  });
                },
                child: Center(
                  child: Text(
                    "Login",
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
*/