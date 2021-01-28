import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_collapse/flutter_collapse.dart';

//class ProtocolsPage extends StatelessWidget {

//  @override
/*Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      elevation: 2,
      margin: EdgeInsets.all(5.0),
      child: SlidingUpPanel(
        body:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              backgroundColor: Colors.white,
              title:  ProtocolWidget(name:"שחרור ממיון ",),
              trailing: SizedBox(),
              children: <Widget>[
                SubProtocol_Widget(name:"שבוע ראשון ללא דריכה על הרגל "),
                SubProtocol_Widget(name:"שימוש בקביים "),
                SubProtocol_Widget(name:"שמירה על רגל מורמת"),
                SubProtocol_Widget(name:"הפעלה סטטית של שרירי הרגל"),
                SubProtocol_Widget(name:"הנעת בהונות לפי יכולת")
              ],
            ),
          ),
      ),
    );
  }
}*/
class ProtocolsPage extends StatefulWidget {
  ProtocolsPage({Key key}) : super(key: key);

  @override
  _ProtocolsPageState createState() => _ProtocolsPageState();
}

class _ProtocolsPageState extends State<ProtocolsPage> {
  bool status1 = false;
  bool status2 =false ;
  bool status3 =false;
  bool status4 =false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        title: Text('collapse'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Protocol_Widget(),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Collapse(
                  padding: EdgeInsets.all(10),
                  title: Text('שחרור ממיון   ',
                    style:TextStyle(
                      fontSize:20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  body: SubProtocol(),
                  value: status1,
                  onChange: (bool value) {
                    setState(() {
                      status1 = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Collapse(
                  padding: EdgeInsets.all(10),
                  title: Text('ביקורת 1 ',
                    style:TextStyle(
                      fontSize:20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  body: SubProtocol(),
                  value: status2,
                  onChange: (bool value) {
                    setState(() {
                      status2 = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Collapse(
                  padding: EdgeInsets.all(10),
                  title: Text('ביקרות 2    ',
                    style:TextStyle(
                      fontSize:20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  body: SubProtocol(),
                  value: status3,
                  onChange: (bool value) {
                    setState(() {
                      status3 = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Collapse(
                  padding: EdgeInsets.all(10),
                  title: Text('ביקרות 3 ',
                    style:TextStyle(
                      fontSize:20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  body: SubProtocol(),
                  value: status4,
                  onChange: (bool value) {
                    setState(() {
                      status4 = value;
                    });
                  },
                ),
              ),],
          ),
        ),
      ),
    );
  }
}
/*class Protocol_Widget extends StatefulWidget {
  Protocol_Widget({Key key}) : super(key: key);

  @override
  _ProtocolsWidgetState createState() => _ProtocolsWidgetState();
}

class _ProtocolsWidgetState extends State<ProtocolsPage> {
  bool status2 = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Collapse(
        padding: EdgeInsets.all(10),
        title: Text('שחרור ממיון ',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SubProtocol(),
        value: status2,
        onChange: (bool value) {
          setState(() {
            status2 = value;
          });
        },
      ),
    );
  }*/


class SubProtocol extends StatelessWidget {
  const SubProtocol({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('שבוע ראשון ללא דריכה על הרגל'),
          Text('שימוש בקביים'),
          Text('שמירה על רגל מורמת'),
          Text('הפעלה סטטית של שרירי הרגל'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            ],
          ),
        ],
      ),
    );
  }
}

