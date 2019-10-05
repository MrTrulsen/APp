import 'package:flutter/material.dart';
import 'CustomIcons.dart';
import 'ProductAdCard.dart';
import 'my_flutter_app_icons.dart';
import 'ProductPage.dart';
import 'LoginPage.dart';
import 'ProductPage2.dart';
import 'AddNewProduct.dart';

void main() => runApp(MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder> {
        "/AddNewProduct":(BuildContext context) => new AddNewProduct(),
        "/ProductPage": (BuildContext context) => new ProductPage2(),
      },
      debugShowCheckedModeBanner: false,
    ));