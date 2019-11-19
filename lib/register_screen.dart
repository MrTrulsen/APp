import 'dart:async';
import 'package:flutter/material.dart';
import 'services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:ui' as prefix0;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              image: new DecorationImage(
                  image: new AssetImage("images/road2.jpg"),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken)),
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
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
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
            height: 550.0,
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
                    Text("Register new user",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: "Raleway",
                          letterSpacing: .6,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 15.0,
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
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.0)),
                        )),
                    SizedBox(
                      height: 25.0,
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
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.0)),
                        )),
                    SizedBox(
                      height: 25.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Display Name",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          controller: disController,
                          decoration: InputDecoration(
                              hintText: "Display Name",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.0)),
                        )),
                    SizedBox(
                      height: 25.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Current City",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          controller: cityController,
                          decoration: InputDecoration(
                              hintText: "Current City",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.0)),
                        )),
                    SizedBox(
                      height: 25.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Occupation",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          controller: occController,
                          decoration: InputDecoration(
                              hintText: "Occupation",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.0)),
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    RaisedButton(
                        onPressed: () async {
                          _toastKey.currentState.showSnackBar(new SnackBar(
                            content: new Row(
                              children: <Widget>[
                                new CircularProgressIndicator(),
                                new Text("   Creating user..."),
                              ],
                            ),
                          ));
                          bool userRegistered = await Services.register(
                                  uidController.text,
                                  pwdController.text,
                                  disController.text,
                                  cityController.text,
                                  occController.text,
                                  "")
                              .whenComplete(() =>
                                  _toastKey.currentState.hideCurrentSnackBar());
                          if (userRegistered == true) {
                            _toastKey.currentState.showSnackBar(new SnackBar(
                              duration: new Duration(seconds: 2),
                              content: new Row(
                                children: <Widget>[
                                  new Text(" User created!..."),
                                ],
                              ),
                            ));
                            new Timer(
                                const Duration(seconds: 2),
                                () => _toastKey.currentState
                                    .hideCurrentSnackBar());
                            new Timer(
                                const Duration(seconds: 1),
                                () => Navigator.of(context)
                                    .pushNamed("/LoginPage"));
                          } else {
                            _toastKey.currentState.hideCurrentSnackBar();
                            return Alert(
                                context: context,
                                title: "Error",
                                desc:
                                    "Something went wrong, user was not created!",
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
                          child: const Text("Register",
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
