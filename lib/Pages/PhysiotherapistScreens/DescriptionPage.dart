import 'package:flutter/material.dart';

//Define "root widget"
void main() => runApp(new DescriptionPage()); //one-line function

class DescriptionPage extends StatelessWidget {
  //Stateless = immutable = cannot change object's properties
  //Every UI components are widgets
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0), //Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text("הסבר התרגיל ",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                //Need to add space below this Text ?
                new Text(
                  "  כבר בתקופת לימודיו בבית הספר התיכון ניבאו לו קריירה מוצלחת ב-NBA. כשהיה בן 18 בלבד הוא נבחר בבחירה מספר 1 בדראפט 2003, ועוד לפני משחק הבכורה שלו חתם על חוזה חסות עם נייקי בשווי 90 מיליון דולר. הוא זכה בתואר רוקי השנה בעונת 2003/2004, ומאז 2005 נכלל כל עונה באחת מחמישיות העונה ב-NBA והשתתף בקביעות במשחק האולסטאר. במהלך שבע שנותיו בקבוצה, ג'יימס היה שחקן ההתקפה המרכזי של קליבלנד, והוביל את הקבוצה להופעות רצופות בפלייאוף בין השנים 2006–2010; בשנת 2007 העפילה קליבלנד עד לגמר האזור המזרחי של ה-NBA לראשונה מאז 1992, ולסדרת הגמר הכללית לראשונה בתולדות הקבוצה, שבה הפסידה לסן אנטוניו ספרס (0–4). הוא זכה בתואר ה-MVP של העונה הסדירה ב-2009, ב-2010, ב-2012 וב-2013, והגיע למקום השני בבחירות ל-MVP ב-2006.  ",
                  style: new TextStyle(color: Colors.grey[850], fontSize: 16.0),
                ),
              ],
            ),
          ),
          new Icon(Icons.favorite, color: Colors.red),
          new Text(
            " 100",
            style: new TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
    //build function returns a "Widget"
    return new MaterialApp(
        title: "",
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Flutter App'),
            ),
            body: new ListView(
              children: <Widget>[
                new Image.asset('images/tutorialChannel.png',
                    fit: BoxFit.cover),
                //You can add more widget bellow
                titleSection
              ],
            ))); //Widget with "Material design"
  }
}
