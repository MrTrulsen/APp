import 'package:first_app/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFe5a900),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 30.0,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                        AssetImage(Services.userLoggedIn.avatarImageUrl),
                  ),
                  Text(
                    Services.userLoggedIn.displayName,
                    style: TextStyle(
                        fontFamily: "Pacifico",
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    Services.userLoggedIn.occupation,
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 30.0,
                      color: Colors.white70,
                      letterSpacing: 2.5,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 200.0,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.portrait,
                        color: Color(0xFFe5a900),
                        size: 30.0,
                      ),
                      title: Text(
                        Services.userLoggedIn.username,
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 20.0,
                          color: Color(0xFFe5a900),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.city,
                        color: Color(0xFFe5a900),
                        size: 25.0,
                      ),
                      title: Text(
                        Services.userLoggedIn.currentCity,
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 20.0,
                          color: Color(0xFFe5a900),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 70.0,
          child: FittedBox(
            child: FloatingActionButton(
              foregroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.cog,
                size: 30.0,
              ),
              onPressed: () {},
            ),
          ),
        ));
  }
}
