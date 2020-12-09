
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class PatientHomePage extends StatefulWidget {
  _PatientHomePageState createState() => _PatientHomePageState();

}

class _PatientHomePageState extends State<PatientHomePage>{

  Material myItems(IconData icon, String heading, int color){

    return Material(
      color: Colors.white70,
      elevation: 20.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(50.0),
      child:Padding(
        padding: const EdgeInsets.all(50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(heading,
                style: TextStyle(
                color: new Color(color),
                fontSize: 25.0
                ),
                ),
                Material(
                  color: new Color(color),
                  borderRadius: BorderRadius.circular(24.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      icon, color: Colors.white,
                      size: 38.0,
                    ),

                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text('Patient',
        style: TextStyle(
        color: Colors.white
        ),
      ),
      ),
      body:StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          myItems(Icons.directions_run, "Home Exercise", 0xffed622b),
          myItems(Icons.bookmark, "Treatment Progress", 0xffff3266),
          myItems(Icons.message, "Chat", 0xff26cb3c),

        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 200.0),
          StaggeredTile.extent(2, 200.0),
          StaggeredTile.extent(2, 200.0),

        ],
      ),
    );
  }



}