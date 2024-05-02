import 'package:http/http.dart' as http;
import 'package:senior_project_ruccab/models/ride.dart';
import 'dart:convert';


class RideService {
  
   Future<List<Ride>> fetchAllRides() async {
    var url = Uri.parse('https://10.0.0.2/3000/rides');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> ridesJson = json.decode(response.body);
      return ridesJson.map((json) => Ride.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rides');
    }
  }
  
  Future<List<Ride>> fetchRidesByDestination(String destination) async {
    var url =
        Uri.parse('https://10.0.0.2/3000/rides?destination=$destination');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> ridesJson = json.decode(response.body);
      return ridesJson.map((json) => Ride.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load rides');
    }
  }

  Future<bool> createRide(Ride ride) async {
    var url = Uri.parse('https://10.0.0.2/3000/rides');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: json.encode(ride.toJson()),
    );

    return response.statusCode == 201;
  }
}
