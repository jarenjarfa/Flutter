import 'package:flutter/material.dart';

class Settings  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Settings"),
        backgroundColor: Colors.red,
      ),
      body: new Container(
        padding: EdgeInsets.all(20),
        child: new Center(
          child:new Column(
            children: <Widget>[
              new Icon(Icons.settings,size: 20,),
              new Text("Settings", style: new TextStyle(fontSize: 20,),)
            ],
          )
        ),
      ),
    );
  }
}