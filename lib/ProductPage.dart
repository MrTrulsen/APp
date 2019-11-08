import 'package:first_app/ProductAdCard.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  var _isLoading = true;
  var products;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFe5a900),
        title: Text("Wanderlust"),
        centerTitle: true,
        actions: <Widget>[],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Ørjan T"),
              accountEmail: new Text("orjant@gmail.com"),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  backgroundImage:
                      new AssetImage("images/User_Avatar-04-512.png"),
                ),
              ),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                fit: BoxFit.fill,
                image: new AssetImage(
                    "images/pawel-czerwinski-IXgSpDrxsgM-unsplash.jpg"),
              )),
            ),
            new ListTile(
              title: new Text("Profile"),
              leading: Icon(Icons.perm_identity),
              onTap: () {
                Navigator.of(context).pushNamed("/ProductPage");
              },
            ),
            new ListTile(
              title: new Text("My Journey"),
              leading: Icon(Icons.directions_walk),
              onTap: () {
                Navigator.of(context).pushNamed("/AddNewProduct");
              },
            ),
            new ListTile(
              title: new Text("Bookmarks"),
              leading: Icon(Icons.bookmark),
              onTap: () {
                Navigator.of(context).pushNamed("/AddNewProduct");
              },
            ),
            new ListTile(
              title: new Text("Help Centre"),
              leading: Icon(Icons.help),
              onTap: () {
                Navigator.of(context).pushNamed("/AddNewProduct");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Logg ut"),
              onTap: () {
                Navigator.of(context).pushNamed("/LoginPage");
              },
            )
          ],
        ),
      ),
      body: new Container(),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xFFe5a900),
        elevation: 3,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
