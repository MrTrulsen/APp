import 'package:first_app/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final currentCityController =
      TextEditingController(text: Services.userLoggedIn.currentCity);
  bool isEnabled = false;
  Color currentCityCardColor = Colors.white70;
  int _currentTab = 0;
  Icon floatingPressed = new Icon(
    FontAwesomeIcons.cog,
    size: 30.0,
  );

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
                    color: currentCityCardColor,
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
                    color: currentCityCardColor,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.city,
                          color: Color(0xFFe5a900),
                          size: 25.0,
                        ),
                        title: TextField(
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: "Raleway",
                            fontSize: 20.0,
                            color: Color(0xFFe5a900),
                          ),
                          controller: currentCityController,
                          enabled: isEnabled,
                          decoration: InputDecoration.collapsed(hintText: ""),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: _currentTab,
            onTap: (int value) {
              setState(() {
                _currentTab = value;
                if (_currentTab == 0) {
                  Navigator.of(context).pushNamed("/MyProfilePage");
                }
                if (_currentTab == 1) {
                  Navigator.of(context).pushNamed("/FavoritesPage");
                }
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                  size: 30.0,
                ),
                title: SizedBox.shrink(),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 30.0,
                ),
                title: SizedBox.shrink(),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          height: 70.0,
          child: FittedBox(
            child: FloatingActionButton(
              foregroundColor: Colors.white,
              child: floatingPressed,
              onPressed: () {
                setState(() {
                  if (floatingPressed.icon == FontAwesomeIcons.cog) {
                    floatingPressed = Icon(FontAwesomeIcons.times);
                    isEnabled = true;
                    currentCityCardColor = Colors.white;
                  } else {
                    if (currentCityController.text !=
                        Services.userLoggedIn.currentCity) {
                      Services.setUserCurrentCity(currentCityController.text.trim());
                    }
                    floatingPressed = Icon(FontAwesomeIcons.cog);
                    isEnabled = true;
                    currentCityCardColor = Colors.white70;
                  }
                });
              },
            ),
          ),
        ));
  }
}
