import 'package:flutter/material.dart';


class BPJS extends StatefulWidget {
  @override
  _BPJSState createState() => _BPJSState();
}

class _BPJSState extends State<BPJS> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: new Card(
        child: new Padding(
          padding: new EdgeInsets.all(5),
          child: new Text(
            "BPJS",
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