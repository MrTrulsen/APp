import 'package:flutter/material.dart';
import 'CustomIcons.dart';
import 'ProductAdCard.dart';
import 'my_flutter_app_icons.dart';
import 'ProductPage.dart';
import 'file.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'ProductAdCard.dart';

class AddNewProduct extends StatelessWidget {

  final nameController = TextEditingController();
  final priceController = TextEditingController();


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    priceController.dispose();
  }


    Future<String> addTheProductPostRequest() async {
    var name = nameController.text;
    var price = priceController.text;
    var img = "bil2";
    final url = "http://192.168.1.101:8080/jakarta-template/api/ad/createad";

    Product productToCreate = new Product(name, price, img);
    String jsonString = jsonEncode(productToCreate);
    var response = await http.post(url,
    headers: {"Content-Type": "application/json"},
    body: jsonString); 
   
    if(response.statusCode == 200){
      return "ok";
    }
    else {
      return "error";
    }

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFd5d5d5),
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: double.infinity,
              height: 400,
              margin: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15.0),
                        blurRadius: 15.0),
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15.0),
                        blurRadius: 15.0),
                  ]),
              child: Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Column(
                  children: <Widget>[
                    Text("Add product",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: "Raleway",
                          letterSpacing: .6,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      height: 30.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Name",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              hintText: "name",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.0)),
                        )),
                    SizedBox(
                      height: 30.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Price",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          controller: priceController,
                          decoration: InputDecoration(
                              hintText: "price",
                              hintStyle: TextStyle(
                                  color: Colors.grey, fontSize: 12.0)),
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Add images",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ))),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: RaisedButton(
                                onPressed: () async {
                                  var value = await addTheProductPostRequest();
                                  if(value == "ok"){
                                    Navigator.of(context).pushNamed("/ProductPage");
                                  }
                                  else{
                                     
                                  }   
                                },
                                color: Color(0xFFe5a900),
                                textColor: Colors.black,
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text("Add product",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                )),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: RaisedButton(
                                onPressed: ()  {
                                    Navigator.of(context).pushNamed("/ProductPage");                                                 
                                },
                                color: Color(0xFFe5a900),
                                textColor: Colors.black,
                                padding: const EdgeInsets.all(0.0),
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: const Text("Cancel",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
