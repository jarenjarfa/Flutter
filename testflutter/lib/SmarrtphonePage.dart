import 'package:flutter/material.dart';

class SmartphonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child:new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20)),
            new Text("SMARTPHONE", style: new TextStyle(fontSize: 30),),
            new Padding(padding: new EdgeInsets.all(20)),
            new Icon(Icons.smartphone, size: 90,)
          ],
        )
      ),
    );
  }
}