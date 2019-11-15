import 'package:flutter/material.dart';
import 'Services.dart';
import 'dart:async';
import 'User.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatelessWidget {
  final uidController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
              image: new AssetImage("images/road2.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Center(
              child: Container(
            width: double.infinity,
            height: 390.0,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.75),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 15.0),
                      blurRadius: 15.0),
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 15.0),
                      blurRadius: 15.0),
                ]),
            child: Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Column(
                children: <Widget>[
                  Text("Wanderlust Login",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: "Raleway",
                        letterSpacing: .6,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 30.0,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Username",
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        controller: uidController,
                        decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                      )),
                  SizedBox(
                    height: 30.0,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password",
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        obscureText: true,
                        controller: pwdController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed("/HomePage"),
                      child: Text("Forgot password?",
                          style: TextStyle(
                            color: Color(0xFFe5a900),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            decoration: TextDecoration.underline,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  RaisedButton(
                      onPressed: () async {
                        User user = await Services.login(
                            uidController.text, pwdController.text);
                        if (user != null) {
                          var a = await Services.fetchLocations(user);
                          var b = await Services.fetchHotels(user, "Ålesund");
                          var c = await Services.fetchActivities(user, "Ålesund");
                          Navigator.of(context).pushNamed("/HomePage");
                        } else {
                          return Alert(
                              context: context,
                              title: "Invalid credentials",
                              desc: "Wrong username or password",
                              image: Image.asset(
                                "images/ops.gif",
                              ),
                              buttons: [
                                DialogButton(
                                  child: Text("OK",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  color: Color(0xFFe5a900),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ]).show();
                        }
                      },
                      color: Color(0xFFe5a900),
                      textColor: Colors.black,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: const Text("Login",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("New to Wanderlust?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          )),
                      SizedBox(
                        width: 8.0,
                      ),
                      InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed("/HomePage"),
                          child: Text("Register",
                              style: TextStyle(
                                color: Color(0xFFe5a900),
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                                decoration: TextDecoration.underline,
                              ))),
                    ],
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
