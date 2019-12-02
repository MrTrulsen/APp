import 'package:first_app/favorites_screen.dart';
import 'package:first_app/register_screen.dart';
import 'package:first_app/maps.dart';
import 'package:flutter/material.dart';
import 'forgot_password_page.dart';
import 'home_screen.dart';
import 'location_screen.dart';
import 'login_screen.dart';
import 'myprofile_screen.dart';



void main() => runApp(MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        "/LoginPage": (BuildContext context) => new LoginPage(),
        "/HomePage": (BuildContext context) => new HomeScreen(),
        "/DestinationPage": (BuildContext context) => new LocationScreen(),
        "/DirectionMap":  (BuildContext context) => new MyMap(),
        "/MyProfilePage": (BuildContext context) => new MyProfileScreen(),
        "/RegisterPage": (BuildContext context) => new RegisterPage(),
        "/ForgotPasswordPage": (BuildContext context) => new ForgotPasswordPage(),
        "/FavoritesPage": (BuildContext context) => new FavoritesScreen(),
      },
      debugShowCheckedModeBanner: false,
    ));