import 'dart:convert';
import 'dart:io';
import 'package:first_app/models/activity_model.dart';
import 'package:first_app/models/location_model.dart';
import 'package:http/http.dart' as http;
import 'User.dart';
import 'models/hotel_model.dart';

class Services {
  static const String url = "http://192.168.1.101:8080";
  static List<Location> locations = [];
  static List<Hotel> hotels = [];
  static List<Activity> activitiesToCity = [];

  static Future<bool> deleteProduct(String name) async {
    try {
      final url = "http://localhost:8080/authenticate";
      var response = await http.delete(url);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<User> login(String username, String password) async {
    try {
      final path = "/authenticate";
      User userToLogin = new User(username, password);
      String jsonString = jsonEncode(userToLogin);
      var response = await http.post(url + path,
          headers: {"Content-Type": "application/json"}, body: jsonString);

      if (response.statusCode == 200) {
        final jsondata = json.decode(response.body);
        userToLogin.token = jsondata["token"];
        return userToLogin;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<bool> fetchLocations(User user) async {
    if(user.username != "" && user.password != ""){
      try {
      final path = "/getLocations";
      final response = await http.get(
        url + path,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
      );

      if (response.statusCode == 200) {
        final jsondata = json.decode(response.body);
        for (var u in jsondata) {
          String city = u["city"];
          Location location = Location(
            imageUrl: u["imageUrl"],
            city: u["city"],
            country: u["country"],
            description: u["description"],
            activities: await fetchActivitiesToLocations(user, city),
          );
          locations.add(location);
        }
        return true;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    }
    return false;
  }

  static Future<List<Activity>> fetchActivitiesToLocations(User user, String city) async {
    
    List<Activity> activities = [];
    try {
      final path = "/getActivities" + "?city=" + city;
      final response = await http.get(
        url + path,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
      );
      if (response.statusCode == 200) {
        final jsondata = json.decode(response.body);
        for (var u in jsondata) {
          Activity activity = Activity(
            imageUrl: u["imageUrl"],
            name: u["name"],
            type: u["type"],
            rating: u["rating"],
            price: u["price"],
            startTimes: u["startTimes"] 
          );
          print(activity);
          activities.add(activity);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return activities;
  }


  static Future<bool> fetchHotels(User user, String city) async {
    try {
      final path = "/getHotels"+ "?city=" + city;
      final response = await http.get(
        url + path,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
      );

      if (response.statusCode == 200) {
        final jsondata = json.decode(response.body);
        for (var u in jsondata) {
          Hotel hotel = Hotel(
            imageUrl: u["imageUrl"],
            address: u["address"],
            price: u["price"],
            name: u["name"],
            description: u["description"],
            url: u["url"],
            rating: u["rating"]
          );
          hotels.add(hotel);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return true;
  }

  static Future<bool> fetchActivities(User user, String city) async {
  
    try {
      final path = "/getActivities" + "?city=" + city;
      final response = await http.get(
        url + path,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
      );
      if (response.statusCode == 200) {
        final jsondata = json.decode(response.body);
        for (var u in jsondata) {
          Activity activity = Activity(
            imageUrl: u["imageUrl"],
            name: u["name"],
            type: u["type"],
            rating: u["rating"],
            price: u["price"],
            startTimes: u["startTimes"] 
          );
          print(activity);
          activitiesToCity.add(activity);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return true;
  }
}
