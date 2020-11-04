import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MyApp()
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow,
        body: SafeArea(
            child:Column(mainAxisAlignment:MainAxisAlignment.center,
                children:<Widget>[
                  CircleAvatar(
                    radius:50,
                    backgroundImage:AssetImage('images/daniel.jpg'),
                  ),
                  Text("daniel the king"
                    ,style:TextStyle(fontSize: 20
                        ,color:Colors.white,
                        letterSpacing: 2.5)
                    ,),
                  Text("Flutter Developer"
                    ,style:TextStyle(
                        fontSize:20,
                        letterSpacing: 2.5)
                    ,)
                  ,SizedBox(
                      height:20.0,
                      width:150,
                      child:Divider(
                        color:Colors.teal
                        ,)
                  )
                  ,Card(
                    color:Colors.white,
                    margin:EdgeInsets.symmetric(vertical:10.0,
                        horizontal:25.0),
                    child:Padding(padding:EdgeInsets.all(5.0),
                      child: Row(
                        children:<Widget> [
                          Icon(Icons.accessibility_new,
                            size:40,),
                          SizedBox(width:10.0
                            ,),
                          Text("daniel"
                            ,),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    color:Colors.white,
                    margin:EdgeInsets.symmetric(vertical:10.0,
                        horizontal:25.0),
                    child:Padding(padding:EdgeInsets.all(5.0),
                      child: Row(
                        children:<Widget> [
                          Icon(Icons.email,
                            size:40,),
                          SizedBox(width:10.0
                            ,),
                          Text("naoryniv@gmail.com"
                            ,),
                        ],
                      ),
                    ),
                  ),
                ]
            )
        ),
      ),
    );
  }
}


