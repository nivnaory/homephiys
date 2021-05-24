import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Controller/PaitentController.dart';

class PhysiotherapistPage extends StatelessWidget {
  final usernameID = TextEditingController();
  PaitentController paitentController = new PaitentController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          _builListOfPaitent(),
        ],
      ),
    );
  }

  Widget _builListOfPaitent() {
    return Expanded(
        child: Center(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return index == 0 ? _searchBar() : _listItem(index);
        },
        itemCount: 6,
      ),
    ));
  }
}

_searchBar() {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: "חפש מטופל "),
      ),
    ),
  );
}
/*
return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: "חפש מטופל "),
      ),
    ),
  );
  */

_listItem(int index) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.only(
          top: 32.0, bottom: 32.0, left: 16.0, right: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 55.0,
                height: 55.0,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.green,
                  backgroundImage: NetworkImage(
                      "https://www.nicepng.com/png/detail/780-7805650_generic-user-image-male-man-cartoon-no-eyes.png"),
                ),
              ),
              SizedBox(width: 5.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("niv",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: FlatButton(
              onPressed: () {},
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                "choose",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
