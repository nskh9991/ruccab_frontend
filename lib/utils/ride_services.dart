import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:senior_project_ruccab/main.dart';
import 'package:senior_project_ruccab/models/ride.dart';
import 'dart:convert';

import 'package:senior_project_ruccab/models/ride_model.dart';
import 'package:senior_project_ruccab/models/vehicle.dart';

class RideService {
  String url = "http://10.0.2.2:3000";
  String iosUrl = "http://127.0.0.1:3000";
  String androidUrl = "http://127.0.0.1:3000";
  RideService() {
    url = Platform.isAndroid ? androidUrl : iosUrl;
  }
  // Future<List<Ride>> fetchAllRides() async {
  //   var response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     List<dynamic> ridesJson = json.decode(response.body);
  //     return ridesJson.map((json) => Ride.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load rides');
  //   }
  // }

  // Future<List<Ride>> fetchRidesByDestination(String destination) async {
  //   var url = Uri.parse('https://10.0.0.2/3000/rides?destination=$destination');
  //   var response = await http.get(url);

  //   if (response.statusCode == 200) {
  //     List<dynamic> ridesJson = json.decode(response.body);
  //     return ridesJson.map((json) => Ride.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Failed to load rides');
  //   }
  // }

  Future<RideModel> fetchRidesByDestination(String destination) async {
    String token = sharedPrefenrece.getString("accessTokenKey") ?? "";
    final response = await http.post(
      Uri.parse('$url/api/ride/showRide'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      },
      body: jsonEncode({"destination": destination}),
    );
    if (response.statusCode == 200) {
      var ridesJson = jsonDecode(response.body);
      print(ridesJson);
      return RideModel.fromJson(ridesJson);
    } else {
      throw Exception('Failed to load rides');
    }
  }

  Future<List<dynamic>> requestARide(String rideId) async {
    String token = sharedPrefenrece.getString("accessTokenKey") ?? "";
    final response = await http.post(
      Uri.parse('$url/api/ride/requestARide'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      },
      body: jsonEncode({"rideId": rideId}),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return [true, json];
    } else {
      return [false, json];
    }
  }

  Future<List<dynamic>> completeRide(String rideId) async {
    String token = sharedPrefenrece.getString("accessTokenKey") ?? "";
    final response = await http.post(
      Uri.parse('$url/api/ride/completeRide'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      },
      body: jsonEncode({"rideId": rideId}),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      print(json);
      return [true, json];
    } else {
      return [false, json];
    }
  }

  Future<List<CarModel>> fetchCars() async {
    String token = sharedPrefenrece.getString("accessTokenKey") ?? "";
    final response = await http.get(
      Uri.parse('$url/api/car/cars'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> carsJson = jsonDecode(response.body);
      return carsJson.map((json) => CarModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load cars');
    }
  }

  // Future<bool> createRide(Ride ride) async {
  //   var url = Uri.parse('https://10.0.0.2/3000/rides');
  //   var response = await http.post(
  //     url,
  //     headers: {'Content-Type': 'application/json; charset=UTF-8'},
  //     body: json.encode(ride.toJson()),
  //   );

  //   return response.statusCode == 201;
  // }
}
