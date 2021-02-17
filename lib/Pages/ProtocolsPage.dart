
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_collapse/flutter_collapse.dart';
import 'package:homephiys/Entity/Protocol.dart';
import 'package:homephiys/Entity/SubProtocol.dart';

class ProtocolsPage extends StatefulWidget {
  final  Protocol protocol;
  ProtocolsPage({@required this.protocol});
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
        title: Text(this.widget.protocol.name),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Collapse(
                  padding: EdgeInsets.all(10),
                  title: Text(this.widget.protocol.subProtocolsList[0].name,
                    style:TextStyle(
                      fontSize:20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  body: SubProtocolView(subProtocol:this.widget.protocol.subProtocolsList[0]),
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
                  title: Text(this.widget.protocol.subProtocolsList[1].name,
                    style:TextStyle(
                      fontSize:20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  body: SubProtocolView(subProtocol:this.widget.protocol.subProtocolsList[1]),
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
                  title: Text(this.widget.protocol.subProtocolsList[2].name,
                    style:TextStyle(
                      fontSize:20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  body: SubProtocolView(subProtocol:this.widget.protocol.subProtocolsList[2]),
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
                  title: Text(this.widget.protocol.subProtocolsList[3].name,
                    style:TextStyle(
                      fontSize:20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  body: SubProtocolView(subProtocol:this.widget.protocol.subProtocolsList[3]),
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

class SubProtocolView extends StatefulWidget {
  final SubProtocol subProtocol;
  SubProtocolView({@required this.subProtocol});
  @override
  _SubProtocolWidgetState createState() => _SubProtocolWidgetState();
}
class  _SubProtocolWidgetState extends State<SubProtocolView> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white10,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
         /* ListView.builder(
              itemCount: this.widget.subProtocol.descriptions.length,
              itemBuilder: (context, itemIndex) {
                return Text(this.widget.subProtocol.descriptions[itemIndex]
                );}),*/
          for ( var i in this.widget.subProtocol.descriptions ) Text(i),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
      ),
    );
  }
}



