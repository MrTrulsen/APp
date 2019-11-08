import 'package:flutter/material.dart';
import 'CustomIcons.dart';

class Product {
  Product(this.name, this.price, this.img);
  final String name;
  final String price;
  final String img;

  Map<String, dynamic> toJson() =>
      {'name': name, 'price': price, 'img': img, 'description': ""};
}


class ProductCardAd extends StatelessWidget {
  String img;
  String price;
  String name;

  ProductCardAd(this.name, this.img, this.price);

  Color iconColor = Colors.black;

  Icon _affectedByStateChange = new Icon(
    Icons.thumb_up,
    color: Colors.grey,
  );
  _thisWillAffectTheState() {
    _affectedByStateChange = new Icon(CustomIcons.favorite, color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
      child: Container(
        width: double.infinity,
        height: 320,
        decoration: BoxDecoration(
            color: Color(0xFFd5d5d5),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.grey.withOpacity(.3), width: .2)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 8.0,
            ),
            new ClipRRect(
              borderRadius: new BorderRadius.circular(20.0),
              child: Image.asset(img, width: 290.0, height: 191.0),
            ),
            Text(name, style: TextStyle(fontSize: 25.0, fontFamily: "Raleway")),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      CustomIcons.favorite,
                      color: iconColor,
                    ),
                    onPressed: () {
                      this.iconColor = Colors.red;
                    },
                  ),
                  Column(
                    children: <Widget>[
                      // Text("\KR " + previousPrice,
                      //     style: TextStyle(
                      //         color: Color(0xFFe5a900),
                      //         fontSize: 16.0,
                      //         fontFamily: "Helvetica")),
                      // SizedBox(
                      //   height: 12.0,
                      // ),
                      Text("\KR " + price,
                          style: TextStyle(
                              fontSize: 23.0, fontFamily: "Helvetica")),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
