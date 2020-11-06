import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'PatientHomePage.dart';

class LoginScreen extends StatefulWidget {

  @override
  LoginScreenState createState() => LoginScreenState();
}
class LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
       new Scaffold(
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
                  //Navigator.push(context,
                     // MaterialPageRoute(builder:(context)=>PatientHomePage()));
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
