import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Controller/PatientController.dart';
import 'package:toast/toast.dart';

import 'LoginScreen.dart';

class PatientRegistrationPage extends StatefulWidget {
  final username;

  PatientRegistrationPage({this.username});

  _PatientRegistrationPage createState() => _PatientRegistrationPage();
}

class _PatientRegistrationPage extends State<PatientRegistrationPage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final userNameId = TextEditingController();
  PatientController patientController = new PatientController();

  List<ListItem> _dropdownItems = [
    ListItem(1, "1"),
    ListItem(2, "2"),
    ListItem(3, "3"),
    ListItem(4, "4")
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;
  var selected = 0;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

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
                  "הרשמה",
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
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    hintText: ':אימייל',
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
          SizedBox(height: 30.0),
          Text(
            ":אנא בחר את מספר תוכנית הטיפול",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          DropdownButton<ListItem>(
              value: _selectedItem,
              items: _dropdownMenuItems,
              onChanged: (value) {
                setState(() {
                  _selectedItem = value;
                  selected = value as int;
                });
              }),
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
                  if (password.text.trim() == confirmPassword.text.trim()) {
                    if (validateEmail(email.text.trim()) == email.text.trim()) {
                      Future f = patientController.createPatient(
                          userNameId.text.trim(),
                          password.text.trim(),
                          name.text.trim(),
                          email.text.trim(),
                          selected);
                      print("successful registration");
                      Toast.show("נרשם בהצלחה", context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }
                  } else {
                    Toast.show(
                        "הסיסמאות לא תואמות, אנא בדוק את הסיסמאות", context,
                        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  }
                },
                child: Center(
                  child: Text(
                    " אשר והמשך",
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

  String validateEmail(String value) {
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

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
