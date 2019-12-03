import 'dart:convert';
import 'dart:io';
import 'package:first_app/maps.dart';
import 'package:first_app/models/activity_model.dart';
import 'package:first_app/models/location_model.dart';
import 'package:first_app/models/restaurant_model.dart';
import 'package:http/http.dart' as http;
import 'user.dart';
import 'models/hotel_model.dart';

class Services {
  static const String url = "http://192.168.1.101:8080";
  static List<Location> locations = [];
  static List<Hotel> hotels = [];
  static List<Restaurant> restaurants = [];
  static List<Activity> activitiesToCity = [];
  static List<Activity> favoriteActivities = [];
  static User userLoggedIn;

  static Future<User> login(String username, String password) async {
    try {
      final path = "/authenticate";
      userLoggedIn = new User(username, password);
      String jsonString = jsonEncode(userLoggedIn);
      var response = await http.post(url + path,
          headers: {"Content-Type": "application/json"}, body: jsonString);

      if (response.statusCode == 200) {
        final jsondata = json.decode(response.body);
        userLoggedIn.token = jsondata["token"];
        String currentCity = await fetchCurrentCity(userLoggedIn);
        String displayName = await fetchDisplayName(userLoggedIn);
        String avatarImageUrl = await fetchUserImage(userLoggedIn);
        String occupation = await fetchOccupation(userLoggedIn);
        //TO DO this is just temp
        if (currentCity == "") {
          userLoggedIn.currentCity = "Ålesund";
          return userLoggedIn;
        }
        userLoggedIn.currentCity = currentCity;
        userLoggedIn.displayName = displayName;
        userLoggedIn.avatarImageUrl = avatarImageUrl;
        userLoggedIn.occupation = occupation;
        return userLoggedIn;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<bool> register(
      String username,
      String password,
      String displayName,
      String currentCity,
      String occupation,
      String avatarImageUrl) async {
    try {
      final path = "/register";
      User registerUser = new User(username, password);
      registerUser.displayName = displayName;
      registerUser.currentCity = currentCity;
      registerUser.occupation = occupation;
      registerUser.avatarImageUrl = "images/User_Avatar-04-512.png";
      String jsonString = jsonEncode(registerUser);

      var response = await http.post(url + path,
          headers: {"Content-Type": "application/json"}, body: jsonString);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<bool> fetchLocations(User user) async {
    if (user.username != "" && user.password != "") {
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

  static Future<List<Activity>> fetchActivitiesToLocations(
      User user, String city) async {
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
              startTimes: u["startTimes"]);
          activities.add(activity);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return activities;
  }

  static Future<bool> fetchHotels(User user) async {
    try {
      final path = "/getHotels" + "?city=" + user.currentCity;
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
              rating: u["rating"]);
          hotels.add(hotel);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return true;
  }

  static Future<bool> fetchRestaurants(User user) async {
    try {
      final path = "/getRestaurants" + "?city=" + user.currentCity;
      final response = await http.get(
        url + path,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
      );

      if (response.statusCode == 200) {
        final jsondata = json.decode(response.body);
        for (var u in jsondata) {
          Restaurant restaurant = Restaurant(
              imageUrl: u["imageUrl"],
              address: u["address"],
              name: u["name"],
              description: u["description"],
              url: u["url"],
              phoneNumber: u["phoneNumber"],
              rating: u["rating"]);
          restaurants.add(restaurant);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return true;
  }

  static Future<bool> fetchActivities(User user) async {
    try {
      final path = "/getActivities" + "?city=" + user.currentCity;
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
              startTimes: u["startTimes"]);
          activitiesToCity.add(activity);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return true;
  }

  static Future<bool> fetchFavorites(User user) async {
    try {
      final path = "/getFavorites";
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
              startTimes: u["startTimes"]);
          favoriteActivities.add(activity);
        }
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return true;
  }

  static Future<bool> removeFavorite(User user, String activity) async {
    try {
      final path = "/removeFavorites?activityName=" + activity;
      final response = await http.delete(
        url + path,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
      );
      if (response.statusCode == 200) {
        await updateFavorites(user);
        return true;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return false;
  }

  static Future<bool> addFavorite(User user, String activity) async {
    try {
      final path = "/addFavorites?activityName=" + activity;
      final response = await http.post(
        url + path,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
      );
      if (response.statusCode == 200) {
        await updateFavorites(user);
        return true;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return false;
  }

  static Future<String> fetchCurrentCity(User user) async {
    String currentCity = "";
    try {
      final path = "/getCurrentCity";
      final response = await http.get(
        url + path,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
      );
      if (response.statusCode == 200) {
        currentCity = response.body;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return currentCity;
  }

  static Future<String> fetchDisplayName(User user) async {
    String displayName = "";
    try {
      final path = "/getDisplayName";
      final response = await http.get(
        url + path,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
      );
      if (response.statusCode == 200) {
        displayName = response.body;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return displayName;
  }

  static Future<String> fetchUserImage(User user) async {
    String avatarImageUrl = "";
    try {
      final path = "/getUserAvatarImageUrl";
      final response = await http.get(
        url + path,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
      );
      if (response.statusCode == 200) {
        avatarImageUrl = response.body;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return avatarImageUrl;
  }

  static Future<String> fetchOccupation(User user) async {
    String occupation = "";
    try {
      final path = "/getOccupation";
      final response = await http.get(
        url + path,
        headers: {HttpHeaders.authorizationHeader: "Bearer " + user.token},
      );
      if (response.statusCode == 200) {
        occupation = response.body;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return occupation;
  }

  static Future<LocationCoordinates> fetchLocation(String address) async {
    LocationCoordinates coor = new LocationCoordinates();
    try {
      final url = "https://maps.googleapis.com/maps/api/geocode/json?address=" +
          address +
          "&key=AIzaSyD4pTOk2AwILedCWEUQ71f1agFqwX8gGkc";
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.body);
        dynamic lat = json.decode(response.body)["results"][0]["geometry"]
            ["location"]["lat"];
        dynamic lng = json.decode(response.body)["results"][0]["geometry"]
            ["location"]["lng"];
        coor.lat = lat;
        coor.lng = lng;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return coor;
  }

  static Future<bool> setUserCurrentCity(String currentCity) async {
    bool success = false;
    try {
      final path = "/setCurrentCity?city=" + currentCity;
      final response = await http.post(
        url + path,
        headers: {
          HttpHeaders.authorizationHeader: "Bearer " + userLoggedIn.token
        },
      );
      if (response.statusCode == 200) {
        success = true;
        userLoggedIn.currentCity = currentCity;
        updateAllValues(currentCity);
        return success;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return success;
  }

  static Future<bool> updateAllValues(String currentCity) async {
    bool success = false;
    locations = [];
    hotels = [];
    restaurants = [];
    activitiesToCity = [];
    favoriteActivities = [];

    try {
      final path = "/setCurrentCity?city=" + currentCity;
      final response = await http.post(
        url + path,
        headers: {
          HttpHeaders.authorizationHeader: "Bearer " + userLoggedIn.token
        },
      );
      if (response.statusCode == 200) {
        await Services.fetchLocations(userLoggedIn);
        await Services.fetchHotels(userLoggedIn);
        await Services.fetchActivities(userLoggedIn);
        await Services.fetchRestaurants(userLoggedIn);
        await Services.fetchFavorites(userLoggedIn);
        success = true;
        userLoggedIn.currentCity = currentCity;
        return success;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return success;
  }

  static Future<bool> updateFavorites(User user) async {
    favoriteActivities = [];
    await fetchFavorites(user);
    return true;
  }

  static bool isActivityFavorite(Activity activity) {
    for (int i = 0; i < favoriteActivities.length; i++) {
      if (favoriteActivities[i].name == activity.name) {
        return true;
      }
    }
    return false;
  }
}
