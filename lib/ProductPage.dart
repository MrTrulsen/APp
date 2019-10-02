import 'package:flutter/material.dart';
import 'CustomIcons.dart';
import 'ProductAdCard.dart';
import 'my_flutter_app_icons.dart';
import 'OneProduct.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ProductPage extends StatelessWidget {
  var _isLoading = true;
  var products;

  fetchData() async {
    print("Attemting to fetch data from network");

    final url = "http://192.168.1.101:8080/jakarta-template/api/ad/getallads";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final formatResponseTest = "{" + "\"products\":" + response.body + "}";

      final map = json.decode(response.body);
      final productsJson = map["products"];
      // map.forEach((product) {
      //     print(product["name"]);
      // });
      this.products = productsJson;

      setState() {
        _isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
            child: new Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0, bottom: 25.0),
                    child: Image.asset("images/86489.png",
                        width: 62.0, height: 43.0),
                  ),
                ),
                GestureDetector(
                    // child: new ProductCardAd("Lamborghini",
                    //     "images/bil2.jpg", "998999"),
                    onDoubleTap: () => fetchData()),
                SizedBox(
                  height: 32.0,
                ),
                GestureDetector(
                    // child: new ProductCardAd("Mclaren",
                    //     "images/bil3.jpg", "998999"),
                    onDoubleTap: () => print("To be")),
                SizedBox(
                  height: 32.0,
                ),
                GestureDetector(
                    // child: new ProductCardAd("Lamborghini",
                    //     "images/bil4.jpg", "998999"),
                    onDoubleTap: () => print("To be")),
                SizedBox(
                  height: 32.0,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xFFe5a900),
        elevation: 3,
        child: Icon(Icons.add),
        onPressed: () {
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                onTap: () {
                },
                child: item,
              ));
            }).toList(),
          )),
    );
  }

  
}

List<Widget> bottomNavIconList = [
  Icon(
    CustomIcons.search,
    size: 32.0,
  ),
  Icon(
    MyFlutterApp.store,
    size: 32.0,
  ),
  Icon(
    CustomIcons.favorite,
    size: 32.0,
  ),
  Icon(CustomIcons.cart, size: 32.0),
  Image.asset("assets/profile.png", width: 35.0, height: 35.0)
];
