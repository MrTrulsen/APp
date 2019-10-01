import 'package:flutter/material.dart';
import 'CustomIcons.dart';
import 'ProductAdCard.dart';
import 'my_flutter_app_icons.dart';
import 'OneProduct.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductPage2 extends StatelessWidget {
  var _isLoading = true;
  final products = [];
  var thisProducts;

  Future<List<ProductCardAd>> getProducts() async {
    print("Attemting to fetch data from network");
    List<ProductCardAd> products = [];
    final url = "http://192.168.1.101:8080/jakarta-template/api/ad/getallads";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final formatResponseTest = "{" + "\"products\":" + response.body + "}";
    
      final jsondata = json.decode(formatResponseTest);

      final productsJson = jsondata["products"];
      print(productsJson);
      for (var u in productsJson) {
        ProductCardAd ad = ProductCardAd(u["name"], u["img"], u["price"]);
        products.add(ad);
      }
      thisProducts = products;
      print(products);
      return thisProducts;
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
                Container(
                  child: FutureBuilder(
                    future: getProducts(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return new Container(
                            width: 0.0,
                            height: 0.0,
                            child: Center(
                              child: Text("Loading"),
                            ));
                      } else {
                        new ListView.builder(
                          itemCount: thisProducts != null ? this.thisProducts.length : 0,
                          itemBuilder: (context, i) {
                            return new Column(
                              children: <Widget>[new Text("$i"), 
                              new Divider(),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xFFe5a900),
        elevation: 3,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => (OneProduct())),
          );
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
                onTap: () {},
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
