import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
          alignment: Alignment.center,
          width: 320,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: BorderRadius.all(Radius.circular(30))),
              
          child: Text("Sign In",
              style:new TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5))),
    );
  }
}
