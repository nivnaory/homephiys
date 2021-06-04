import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homephiys/Controller/PatientController.dart';
import 'package:homephiys/Entity/Patient.dart';
import 'package:homephiys/Pages/PhysiotherapistScreens/PhysiotherapistControlPage.dart';

class PhysiotherapistPage extends StatefulWidget {
  final usernameID = TextEditingController();
  PatientController patientController = new PatientController();
  List<Patient> allPatients=[];
  List<Patient> patientToDisplay=[];
  PhysiotherapistPage({this.allPatients});
_PhysiotherapistPage createState() => _PhysiotherapistPage();
}

class _PhysiotherapistPage extends State<PhysiotherapistPage> {

  @override
  void initState() {
    super.initState();
    this.widget.patientToDisplay=this.widget.allPatients;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Column(
        children: <Widget>[
          SizedBox(height: 100.0),
          _searchBar(),
          _builListOfPatient(),
        ],
      ),
    );
  }

  Widget _builListOfPatient() {
    return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
            return   _listItem(index);
            },
            itemCount: this.widget.patientToDisplay.length,
          ),
        );
  }


  _searchBar() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(hintText: "חפש מטופל "),
          onChanged:(text) {
            text=text.toLowerCase();
            setState(() {
              this.widget.patientToDisplay =this.widget.allPatients.where((patient) {
                var patientName=patient.firstName.toLowerCase();
                 return patientName.contains(text);
              }).toList();
            });
          },
        ),
      ),
    );
  }


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
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        "https://www.nicepng.com/png/full/367-3671905_person-icon-person-icon-silhouette.png"),
                  ),
                ),
                SizedBox(width: 5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(this.widget.patientToDisplay[index].firstName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                    Text(this.widget.patientToDisplay[index].username,
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhysiotherapistControlPage(patient:this.widget.patientToDisplay[index])));
                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  "בחר",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
