import 'package:flutter/material.dart';
import 'CustomIcons.dart';
import 'ProductAdCard.dart';
import 'my_flutter_app_icons.dart';
import 'OneProduct.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Testy extends StatelessWidget {
  var _isLoading = true;
  var products;

  _fetchData() async {
    print("Attemting to fetch data from network");
    final url = "http://192.168.1.101:8080/jakarta-template/api/ad/getallads";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final formatResponseTest = "{" + "\"products\":" + response.body + "}";

      final map = json.decode(formatResponseTest);
      final productsJson = map["products"];
      print(productsJson);
      // map.forEach((product) {
      //     print(product["name"]);
      // });
      this.products = productsJson;
      if (products = !null) {
        _isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: _isLoading
              ? new CircularProgressIndicator()
              : new ListView.builder(
                  itemCount: this.products = !null ? this.products.length : 0,
                  itemBuilder: (context, i) {
                    final product = this.products[i];
                    if (products = !null) {
                      _isLoading = false;
                    }
                    return new Column(
                      children: <Widget>[
                        new ProductCardAd(
                          product["name"],
                          product["img"],
                          product["price"],
                        ),

                        //new Divider()
                      ],
                    );
                  },
                )),
    );
  }
}
