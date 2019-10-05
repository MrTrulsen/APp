import 'package:flutter/material.dart';
import 'CustomIcons.dart';
import 'ProductAdCard.dart';
import 'my_flutter_app_icons.dart';
import 'OneProduct.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Services.dart';

class ProductPage2 extends StatefulWidget {
  ProductPage2() : super();

  @override
  ProductAdPage createState() => ProductAdPage();
}

class ProductAdPage extends State<ProductPage2> {
  List<ProductCardAd> products = List();
  List<ProductCardAd> filteredProducts = List();
  bool searching = false;
  Icon searchIcon = Icon(Icons.search);

  @override
  void initState() {
    super.initState();
    Services.getProducts().then((productsFromServer) {
      setState(() {
        products = productsFromServer;
        filteredProducts = products;
      });
    });
  }

  Widget getSearchBar() {
    if (searching == true) {
      return TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          hintText: "Search for product",
        ),
        onChanged: (string) {
          setState(() {
            filteredProducts = products
                .where((u) =>
                    (u.name.toLowerCase().contains(string.toLowerCase()) ||
                        u.price.toLowerCase().contains(string.toLowerCase())))
                .toList();
          });
        },
      );
    } else {
      return Container();
    }
  }

  Widget getListOfProducts() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: filteredProducts.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return filteredProducts[index];
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFe5a900),
        title: Text("FantApp"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: searchIcon,
            onPressed: () {
              setState(() {
                if (searching == false) {
                  searchIcon = Icon(Icons.close);
                  searching = true;
                }
                else{
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
            child: getListOfProducts(),
          )
        ],
      ),
      //child: getListOfProducts(),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xFFe5a900),
        elevation: 3,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed("/AddNewProduct");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
