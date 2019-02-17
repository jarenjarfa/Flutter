import 'package:flutter/material.dart';

class Pulsa extends StatefulWidget {
  @override
  _PulsaState createState() => _PulsaState();
}

class _PulsaState extends State<Pulsa> {
  List<String> provider = ["Indosat", "Telkomsel", "Tri", "XL", "Smartfren"];
  String providerDefault = "Indosat";

 /* var nominal = [
    {"id": "1", "nominal": "5.000"},
    {"id": "2", "nominal": "10.000"},
    {"id": "3", "nominal": "15.000" },
    {"id": "4", "nominal": "20.000"},
    {"id": "5", "nominal": "25.000"},
    {"id": "6", "nominal": "50.000"},
    
  ];*/

  /* var provider = [
    {"id": "1", "name": "Indosat"},
    {"id": "2", "name": "Telkomsel"},
    {"id": "3", "name": "Tri" },
    {"id": "4", "name": "XL"},
    {"id": "5", "name": "Smartfren"},
  ];*/



 /* var providerDefault = [
    {"id": "1", "name": "Indosat"},
  ];*/
  void selectProvider(var value) {
    setState(() {
      providerDefault = value;
    });
  }

  void selectNominal(var value) {
    setState(() {
      providerDefault = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10),
      child: new Card(
        child: new Padding(
          padding: new EdgeInsets.all(5),
          child: Column(
            children: <Widget>[
              new TextField(
                controller: null,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                decoration: new InputDecoration(
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
              new DropdownButtonFormField(
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
                onChanged: (String value) {
                  selectProvider(value);
                },
                value: providerDefault,
                items: provider.map((var value) {
                  return new DropdownMenuItem(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
