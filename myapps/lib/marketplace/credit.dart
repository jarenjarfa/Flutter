import 'package:flutter/material.dart';

class Credit extends StatefulWidget {
  @override
  _CreditState createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: new Card(
        child: new Padding(
          padding: new EdgeInsets.all(5),
          child: new Text(
            "Credit",
            style:new TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}