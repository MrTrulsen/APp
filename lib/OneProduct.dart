import 'package:flutter/material.dart';
import 'CustomIcons.dart';
import 'ProductAdCard.dart';
import 'my_flutter_app_icons.dart';
import 'ProductPage.dart';
import 'LoginPage.dart';
import 'Services.dart';

class OneProduct extends StatelessWidget {
  String img;
  String price;
  String name;

  OneProduct(this.name, this.img, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFe5a900),
        centerTitle: true,
        title: Text("FantApp"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: new Column(
              children: <Widget>[
                GestureDetector(
                    child: new OneProductAd(0xFFd5d5d5, name, img, price),
                    onDoubleTap: () => print("To be ")),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OneProductAd extends StatelessWidget {
  int cardColor;
  String imgUrl;
  String price;
  String title;

  OneProductAd(this.cardColor, this.title, this.imgUrl, this.price);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
          color: Color(cardColor),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey.withOpacity(.3), width: .2)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8.0,
          ),
          new ClipRRect(
            borderRadius: new BorderRadius.circular(20.0),
            child: Image.asset(imgUrl, width: 290.0, height: 191.0),
          ),
          Text(title, style: TextStyle(fontSize: 25.0, fontFamily: "Raleway")),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: 25.0,
          ),
          Text("NOK " + price,
              style: TextStyle(
                fontSize: 25.0,
              )),
          SizedBox(
            height: 45.0,
          ),
          RaisedButton(
              onPressed: () {
                Services.deleteProduct(this.title);
                Navigator.of(context).pushNamed("/ProductPage");
              },
              color: Color(0xFFe5a900),
              textColor: Colors.black,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: const Text("Purchase",
                    style: TextStyle(
                      fontSize: 20,
                    )),
              )),
        ],
      ),
    );
  }
}
