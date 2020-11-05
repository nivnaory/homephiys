import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}



class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset:false,
      body: Column(
      children: <Widget>[
        Container(
          child:Stack(
           children: <Widget>[
             Container(
               padding:EdgeInsets.fromLTRB(10.0, 150.0, 0.0, 50.0),
               child:Text("Login",
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
              TextField( obscureText: false,
              decoration: InputDecoration(
                border:OutlineInputBorder(
                    borderRadius:BorderRadius.circular(30)
                   ),
                   hintText:'Ex:emailName@gmail.com',
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

        )
      ],
    ),
    );
  }
}
