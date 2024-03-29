import 'package:first_app/services.dart';
import 'package:first_app/hotel_carousel.dart';
import 'package:first_app/restaurant_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'activity_carousel.dart';
import 'location_carousel.dart';
import 'my_flutter_app_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.mapMarkedAlt,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.hiking,
    FontAwesomeIcons.utensils
  ];

  Widget _buildMainPage(int index) {
    if (index == 0) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          LocationCarousel(),
          SizedBox(
            height: 10.0,
          ),
          HotelCarousel(),
          SizedBox(
            height: 10.0,
          ),
          ActivityCarousel(),
          SizedBox(
            height: 10.0,
          ),
          RestaurantCarousel(),
        ],
      );
    } else if (index == 1) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          HotelCarousel(),
          SizedBox(
            height: 10.0,
          ),
          ActivityCarousel(),
          SizedBox(
            height: 10.0,
          ),
          LocationCarousel(),
          SizedBox(
            height: 10.0,
          ),
          RestaurantCarousel(),
        ],
      );
    } else if (index == 2) {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          ActivityCarousel(),
          SizedBox(
            height: 10.0,
          ),
          HotelCarousel(),
          SizedBox(
            height: 10.0,
          ),
          LocationCarousel(),
          SizedBox(
            height: 10.0,
          ),
          RestaurantCarousel(),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          RestaurantCarousel(),
          SizedBox(
            height: 10.0,
          ),
          LocationCarousel(),
          SizedBox(
            height: 10.0,
          ),
          HotelCarousel(),
          SizedBox(
            height: 10.0,
          ),
          ActivityCarousel(),
        ],
      );
    }
  }

  Widget _buildIcon(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
            _buildMainPage(index);
          });
          print(_selectedIndex);
        },
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              color: _selectedIndex == index
                  ? Theme.of(context).accentColor
                  : Color(0xFFE7EBEE),
              borderRadius: BorderRadius.circular(30.0)),
          child: Icon(
            _icons[index],
            size: 25.0,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColorLight
                : Color(0XFFB4C1C4),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'What would you like to find?',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            _buildMainPage(_selectedIndex),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
            if (_currentTab == 2) {
              Navigator.of(context).pushNamed("/MyProfilePage");
            }
            if(_currentTab == 1){
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
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: AssetImage(Services.userLoggedIn.avatarImageUrl),
            ),
            title: SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
