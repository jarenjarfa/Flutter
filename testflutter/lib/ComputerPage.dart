import 'package:flutter/material.dart';

class ComputerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Center(
        child:new Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20)),
            new Text("COMPUTER", style: new TextStyle(fontSize: 30),),
            new Padding(padding: new EdgeInsets.all(20)),
            new Icon(Icons.computer, size: 90,)
          ],
        )
      ),
    );
  }
}