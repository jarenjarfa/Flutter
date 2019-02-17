import 'package:flutter/material.dart';

class TokenPLN extends StatefulWidget {
  @override
  _TokenPLNState createState() => _TokenPLNState();
}

class _TokenPLNState extends State<TokenPLN> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: new Card(
        child: new Padding(
          padding: new EdgeInsets.all(5),
          child: new Text(
            "Token PLN",
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