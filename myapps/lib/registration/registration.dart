import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(new MaterialApp(
    title: "Learning Flutter",
//    home: new ListViewJsonData(data: new List<String>.generate(300,(i)=>"ini data ke $i" ),),

    home: new Registration(),
    theme: buildTheme(),
  ));
}

ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.white,
  );
}

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green[600],
        title: new Text("Registration"),
      ),
      body: new Container(
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
          child: new ListView(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(20),
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: firstnameController,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))
                      ],
                      decoration: new InputDecoration(
                        icon: Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                        hintText: "Firstname",
                        hintStyle: TextStyle(color: Colors.white54),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                    new TextField(
                      controller: lastnameController,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.text,
                      inputFormatters: [
                        WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))
                      ],
                      decoration: new InputDecoration(
                        icon: Icon(
                          Icons.people,
                          color: Colors.white,
                        ),
                        hintText: "Lastname",
                        hintStyle: TextStyle(color: Colors.white54),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                    new TextField(
                      controller: phoneController,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        WhitelistingTextInputFormatter(RegExp("[0-9]"))
                      ],
                      decoration: new InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.white54),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                    new TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: new InputDecoration(
                        icon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white54),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                    new TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: new InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white54),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.black,
                          child: new Text("Sign Up", style: TextStyle(color: Colors.white),),
                          
                        ),
                        Padding(padding: EdgeInsets.all(10),),
                        RaisedButton(
                          child: new Text("Clear",style: TextStyle(color: Colors.white),),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
