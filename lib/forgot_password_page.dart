import 'dart:async';
import 'dart:ui' as prefix0;
import 'package:flutter/material.dart';
import 'services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPage createState() => _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  final uidController = TextEditingController();
  final pwdController = TextEditingController();
  final disController = TextEditingController();
  final cityController = TextEditingController();
  final occController = TextEditingController();
  static GlobalKey<ScaffoldState> _toastKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _toastKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              color: Colors.black54,
              image: new DecorationImage(
                image: new AssetImage("images/road2.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)
              ),
            ),
            child: new BackdropFilter(
              filter: new prefix0.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: new Container(
                decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 35.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          Center(
              child: Container(
            width: double.infinity,
            height: 270.0,
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
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text("Forgot password",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: "Raleway",
                          letterSpacing: .6,
                          fontWeight: FontWeight.bold,
                        )),
                        SizedBox(
                      height: 15.0,
                    ),
                        Text("Enter your email address and we'll send you a link to reset your password.",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: "Raleway",
                          letterSpacing: .6,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 25.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Registred email",
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
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.0)),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                        onPressed: () async {},
                        color: Color(0xFFe5a900),
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: const Text("Reset password",
                              style: TextStyle(
                                fontSize: 20,
                              )),
                        )),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
