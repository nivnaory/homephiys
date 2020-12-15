import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';




import 'PatientHomePage.dart';

class LoginScreen extends StatefulWidget {

  @override
  LoginScreenState createState() => LoginScreenState();
}
class LoginScreenState extends State<LoginScreen> {
  final myController = TextEditingController();
  /*
  create 2 attaribute of text field

  one for the email and one for the password
   */

  @override
  Widget build(BuildContext context) {
       return  Scaffold(
        resizeToAvoidBottomInset:false,
        body: Column(
        children: <Widget>[
          Container(
            child:Stack(
             children: <Widget>[
               Container(
                 padding:EdgeInsets.fromLTRB(10.0, 150.0, 0.0, 50.0),
                 child:Text("homePhiys",
                   style:TextStyle(
                  fontSize:70,fontWeight: FontWeight.bold,fontFamily:'Lobster'),
                 ),
               )
             ],
             )
          ),
          Container(
            padding: EdgeInsets.only(top:55.0,left:20.0,right:20.0),
            child: Column(
              children: <Widget>[
                TextField( obscureText: false,controller:myController,
                decoration: InputDecoration(
                  border:OutlineInputBorder(
                      borderRadius:BorderRadius.circular(30)
                     ),
                     hintText:'Ex:id:123456789',
                 ),
                ),
                SizedBox(height:30.0),
                TextField( obscureText: true,
                  decoration: InputDecoration(
                    border:OutlineInputBorder(
                        borderRadius:BorderRadius.circular(30)
                    ),
                    hintText:'Password  ',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:5.0),
          Container(
            alignment:Alignment(1.0,0.0),
            padding:EdgeInsets.only(top:15.0,left: 18.0),
            child:Text("forgot password"
           ,style: TextStyle(
                color:Colors.black,
                  fontWeight:FontWeight.bold,
                  fontSize:20,
                  fontFamily:'Lobster'
              ),
            )
          ),
          SizedBox(height:30.0),
          Container(
            height:50.0,
            child:Material(
              borderRadius:BorderRadius.circular(200.0),
              shadowColor:Colors.greenAccent,
              color:Colors.green,
              elevation: 7.0,
              child:GestureDetector(
                onTap:(){
                    setState(() {
                        Future f=loginUser(myController.text);
                        f.then((value){
                        if (value==true){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  PatientHomePage()));
                        }else {
                          print("im here!");
                          Toast.show("Login Faild", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

                         }});
                       });
                },
                child:Center(
                  child:Text(
                    "Login",
                    style:TextStyle(
                      color:Colors.black,
                      fontWeight:FontWeight.bold,
                      fontSize:25,
                      fontFamily:'IndieFlower'
                    ),
                  ),
                ),
              )
              ,
            ),
          )
        ],
         ),
      );
     }
}


//check if the user exsist on the database
Future<bool> loginUser(String username) async {
  final http.Response response = await http.post(
    'http://10.0.2.2:5000/user/login/paitent',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': username,
    }),
  );

  if (response.statusCode == 200) {
    print("ok");
    return Future.value(true);
  }
  return Future.value(false);
}
