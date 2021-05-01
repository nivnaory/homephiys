import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Controller/PaitentController.dart';

class PhysiotherapistPage extends StatelessWidget {
  final usernameID = TextEditingController();
  PaitentController paitentController = new PaitentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          //width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height*0.50,
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 150.0, 0.0, 50.0),
            child: Text(
              "HomePhys",
              style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lobster'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                Text(
              ":אנא הכנס את תעודת הזהות של המטופל",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,),
            ),
                SizedBox(height: 100.0),

                TextField(
                  obscureText: false,
                  controller: usernameID,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: 'ת.ז: לדוגמא: 123456789',
                  ),
                ),
                SizedBox(height: 200.0),
                Container(
                  height: 50.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(200.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.green,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "חפש",
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
          )
        ]));
  }
}
