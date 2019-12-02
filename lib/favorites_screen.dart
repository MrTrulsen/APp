import 'package:first_app/services.dart';
import 'package:first_app/snow_effect.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'acitvity_screen.dart';
import 'models/activity_model.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  FavoritesScreenState createState() => FavoritesScreenState();
}

class FavoritesScreenState extends State<FavoritesScreen> {
  int _currentTab = 0;
  Icon searchIcon = Icon(Icons.search);
  bool searching = false;
  List<Activity> currentActivites = Services.activitiesToCity;
  List<Activity> filteredActivites = Services.activitiesToCity;

  @override
  void initState() {
    super.initState();
  }

  Widget getSearchBar() {
    if (searching == true) {
      return TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          hintText: "Search for activity",
        ),
        onChanged: (string) {
          setState(() {
            filteredActivites = currentActivites
                .where((u) =>
                    (u.name.toLowerCase().contains(string.toLowerCase())))
                .toList();
          });
        },
      );
    } else {
      filteredActivites = currentActivites;
      return Container();
    }
  }

  Widget getListOfAcitivities() {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: filteredActivites.length,
        itemBuilder: (BuildContext context, int index) {
          Activity activity = filteredActivites[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(activity.imageUrl),
            ),
            trailing: Icon(FontAwesomeIcons.heart, color: Colors.red,),
            title: Text(activity.name),
            subtitle: Text(activity.type),
          );
        },
      ),
    );
  }

  //anim
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xFFe5a900),
        title: Text("Favorite activites"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: searchIcon,
            onPressed: () {
              setState(() {
                if (searching == false) {
                  searchIcon = Icon(Icons.close);
                  searching = true;
                } else {
                  searchIcon = Icon(Icons.search);
                  searching = false;
                }
              });
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: getSearchBar(),
          ),
          Expanded(
            child: getListOfAcitivities(),
          ),
        ],
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
              if (_currentTab == 1) {
                Navigator.of(context).pushNamed("/MyProfilePage");
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
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage:
                    AssetImage(Services.userLoggedIn.avatarImageUrl),
              ),
              title: SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
