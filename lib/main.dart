import 'package:first_app/LocationScreen.dart';
import 'package:first_app/maps.dart';
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'HomePage.dart';


void main() => runApp(MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        "/LoginPage": (BuildContext context) => new LoginPage(),
        "/HomePage": (BuildContext context) => new HomeScreen(),
        "/DestinationPage": (BuildContext context) => new LocationScreen(),
        "/DirectionMap":  (BuildContext context) => new MyMap(),
      },
      debugShowCheckedModeBanner: false,
    ));