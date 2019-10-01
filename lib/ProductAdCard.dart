import 'package:flutter/material.dart';
import 'CustomIcons.dart';


class ProductCardAd extends StatelessWidget {
  String img;
  String price;
  String name;

  ProductCardAd( this.name, this.img, this.price);

  @override
  Widget build(BuildContext context) {
    return new Container(
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
            Text(name,
                style: TextStyle(fontSize: 25.0, fontFamily: "Raleway")),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(CustomIcons.favorite),
                    onPressed: () {},
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
                  IconButton(
                    icon: Icon(CustomIcons.cart),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ));
  }
}
