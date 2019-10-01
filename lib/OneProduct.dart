import 'package:flutter/material.dart';
import 'CustomIcons.dart';
import 'ProductAdCard.dart';
import 'my_flutter_app_icons.dart';
import 'ProductPage.dart';
import 'LoginPage.dart';

class OneProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: new Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProductPage()),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 0.0, bottom: 25.0),
                    child: Image.asset("images/86489.png",
                        width: 62.0, height: 43.0),
                  ),
                ),
                GestureDetector(
                    child: new OneProductAd(0xFFd5d5d5, "Lamborghini",
                        "images/bil2.jpg", "2000000", "998999"),
                    onDoubleTap: () => print("To be ")),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
          height: 70.0,
          decoration: BoxDecoration(color: Color(0xFFe5a900), boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.065),
                offset: Offset(0.0, -3.0),
                blurRadius: 10.0)
          ]),
          child: Row(
            children: bottomNavIconList.map((item) {
              return Expanded(
                  child: GestureDetector(
                onTap: () {},
                child: item,
              ));
            }).toList(),
          )),
    );
  }
}

class OneProductAd extends StatelessWidget {
  int cardColor;
  String imgUrl;
  String previousPrice;
  String price;
  String title;

  OneProductAd(
      this.cardColor, this.title, this.imgUrl, this.previousPrice, this.price);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      height: 450,
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
          Text("NOK " + previousPrice,
              style: TextStyle(fontSize: 16.0, color: Color(0xFFe5a900))),
          SizedBox(
            height: 15.0,
          ),
          Text("NOK " + price,
              style: TextStyle(
                fontSize: 25.0,
              )),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
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
