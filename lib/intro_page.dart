import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: Container(
                width: width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("images/road1.jpg"),
                  fit: BoxFit.cover, 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


