import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: Icon(Icons.home),
        title: new Text("Home"),
        backgroundColor: Colors.green[600],
      ),
      body: Text("Welcome to Homepage"),
    );
  }
}