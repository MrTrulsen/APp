import 'package:flutter/material.dart';
import 'CustomIcons.dart';
import 'ProductAdCard.dart';
import 'my_flutter_app_icons.dart';
import 'ProductPage.dart';
import 'Services.dart';
import 'dart:async';

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
              image: new AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            )),
          ),
          Center(
              child: Container(
            width: double.infinity,
            height: 350.0,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
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
                  Text("Fant Login",
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
                            hintText: "username",
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
                        controller: pwdController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0)),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      onPressed: () {
                        Services.login(uidController.text, pwdController.text)
                            .then((val) {
                          if (val == true) {
                            Navigator.of(context).pushNamed("/ProductPage");
                          }
                        });
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
                      Text("Don't have an account yet?",
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
