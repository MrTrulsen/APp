import 'dart:convert';
import 'package:http/http.dart' as http;
import 'ProductAdCard.dart';

class Services {
  static const String url =
      "http://192.168.1.101:8080/jakarta-template/api/ad/getallads";

  static Future<List<ProductCardAd>> getProducts() async {
    try {
      List<ProductCardAd> products = [];
      final url = "http://192.168.1.101:8080/jakarta-template/api/ad/getallads";
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final formatResponseTest = "{" + "\"products\":" + response.body + "}";
        final jsondata = json.decode(formatResponseTest);
        List<ProductCardAd> list = List();
        final productsJson = jsondata["products"];
        print(productsJson);
        for (var u in productsJson) {
          ProductCardAd ad = ProductCardAd(
              u["name"], "images/" + u["img"] + ".jpg", u["price"]);
          list.add(ad);
        }
        return list;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static Future<bool> deleteProduct(String name) async {
    try{
    final url = "http://192.168.1.101:8080/jakarta-template/api/ad/deletead?name="+name;
    var response = await http.delete(url);
   
    if(response.statusCode == 200){
      return true;
    }
    else {
      return false;
    }
    }
    catch(e){
        throw Exception(e.toString());
    }
  }

  static Future<bool> login(String name, String password) async {
    try{
    final url = "http://192.168.1.101:8080/jakarta-template/api/auth/login?uid="+name+"&pwd="+password;
    var response = await http.get(url);
   
    if(response.statusCode == 200){
      return true;
    }
    else {
      return false;
    }
    }
    catch(e){
        throw Exception(e.toString());
    }
  }

}
