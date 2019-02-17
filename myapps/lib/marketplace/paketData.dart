import 'package:flutter/material.dart';

class PaketData extends StatefulWidget {
  @override
  _PaketDataState createState() => _PaketDataState();
}

class _PaketDataState extends State<PaketData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: new Card(
        child: new Padding(
          padding: new EdgeInsets.all(5),
          child: new Text(
            "Paket Data",
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