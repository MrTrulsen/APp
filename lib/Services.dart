import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User.dart';
import 'Token.dart';

class Services {
  static const String url =
      "http://localhost:8080/authenticate";


  static Future<bool> deleteProduct(String name) async {
    try{
    final url = "http://localhost:8080/authenticate";
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

  static Future<bool> login(String username, String password) async {
    try{
    final url = "http://192.168.1.101:8080/authenticate";
    User userToLogin = new User(username,password);
    String jsonString = jsonEncode(userToLogin);
    var response = await http.post(url,
    headers: {"Content-Type": "application/json"},
    body: jsonString);

    if(response.statusCode == 200){
      final jsondata = json.decode(response.body);
      userToLogin.token = jsondata["token"];
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
