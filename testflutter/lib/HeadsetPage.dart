import 'package:flutter/material.dart';

class HeadsetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child:new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20)),
            new Text("HEADSET", style: new TextStyle(fontSize: 30),),
            new Padding(padding: new EdgeInsets.all(20)),
            new Icon(Icons.headset, size: 90,)
          ],
        )
      ),
    );
  }
}