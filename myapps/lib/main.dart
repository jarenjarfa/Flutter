import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapps/login/loginAnimation.dart';
import 'package:myapps/login/signIn.dart';
import 'package:http/http.dart' as http;
import 'package:myapps/registration/registration.dart';

void main() {
  runApp(new MaterialApp(
    title: "Learning Flutter",
//    home: new ListViewJsonData(data: new List<String>.generate(300,(i)=>"ini data ke $i" ),),

    home: new LoginPage(),
    //  theme: buildTheme(),
  ));
}

ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.white,
  );
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  var statusKlik = 0;
  TextEditingController editingControllerUsername;
  TextEditingController editingControllerPassword;
  AnimationController animationControllerButton;
  String usernameResponse = "fajar";
  String passwordResponse = "12345";
  String errorMessageUsername = "";
  String errorMessagePassword = "";

  void _alertDialog() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
        "kosong",
        style: TextStyle(fontSize: 20),
      ),
      actions: <Widget>[
        new RaisedButton(
          color: Colors.purple,
          child: new Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  @override
  void initState() {
    editingControllerUsername = new TextEditingController(text: '');
    editingControllerPassword = new TextEditingController(text: '');
    errorMessageUsername = '';
    errorMessagePassword = '';
    super.initState();
    animationControllerButton =
        AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              setState(() {
                statusKlik = 0;
              });
            }
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationControllerButton.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await animationControllerButton.forward();
      await animationControllerButton.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/bg.jpg"), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromARGB(162, 146, 199, 1),
                Color.fromARGB(51, 51, 63, 1),
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 270)),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            TextField(
                              controller: editingControllerUsername,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person_outline,
                                  color: Colors.white,
                                ),
                                hintText: "Username",
                                hintStyle: TextStyle(color: Colors.white54),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                              ),
                            ),
                            new Text(
                              errorMessageUsername,
                              style: new TextStyle(color: Colors.red),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                            ),
                            TextField(
                              controller: editingControllerPassword,
                              // validator: (){},
                              obscureText: true,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(color: Colors.white54),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                              ),
                            ),
                            new Text(errorMessagePassword,
                                style: new TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom:80),
                      )
                    ],
                    
                  ),
                  statusKlik == 0
                      ? new InkWell(
                        
                          onTap: () {
                            print(
                                "===================LOGIN====================");
                            if (editingControllerUsername.text.isEmpty ||
                                editingControllerPassword.text.isEmpty) {
                              setState(() {
                                if (editingControllerUsername.text.isEmpty) {
                                  errorMessageUsername = "Please fill username";
                                  print("Empty Username");
                                } else {
                                  errorMessageUsername = "";
                                  print(
                                      "Username : $editingControllerUsername");
                                }
                                if (editingControllerPassword.text.isEmpty) {
                                  errorMessagePassword = "Please fill password";
                                  print("Empty Password");
                                } else {
                                  errorMessagePassword = "";
                                  print(
                                      "Password : $editingControllerPassword");
                                }
                              });
                            } else {
                              setState(() {
                                statusKlik = 1;
                                errorMessageUsername = "";
                                errorMessagePassword = "";
                              });
                              _playAnimation();
                              print("Username : $editingControllerUsername");
                              print("Password : $editingControllerPassword");
                            }
                          },
                          child: new SignIn(),
                        )
                      : new StartAnimation(
                          buttonController: animationControllerButton.view,
                          user: editingControllerUsername.text,
                          password: editingControllerPassword.text,
                          userResponse: usernameResponse,
                          passwordResponse: passwordResponse,
                        ),
                ],
              ),
              FlatButton(
                onPressed: () {
                  errorMessageUsername = "";
                  errorMessagePassword = "";
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Registration()));
                },
                child: Text(
                  "Don't have an account ? Sign Up here",
                  style: new TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
