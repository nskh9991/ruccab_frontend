import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:senior_project_ruccab/main.dart';
import 'package:senior_project_ruccab/models/info_model.dart';
import 'package:senior_project_ruccab/models/ride_model.dart';

class HttpRequests {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String url = "http://10.0.2.2:3000";
  String iosUrl = "http://127.0.0.1:3000";
  String androidUrl = "http://127.0.0.1:3000";
  String androidEmulator = 'http://10.0.2.2:3000';
  HttpRequests() {
    url = Platform.isAndroid ? androidUrl : iosUrl;
  }
  bool? isEmulator;

  Future<List<Object>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$url/api/auth/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    var res = jsonDecode(response.body);

    if (response.statusCode == 200) {
      String accessToken = res['accessToken'];
      print('Access Token: $accessToken');
      saveString(accessToken, "accessTokenKey");
      return [true, res];
    } else {
      return [false, res];
    }
  }

  Future<List<Object>> signUp(
      String email,
      String password,
      String first_name,
      String last_name,
      String gender,
      String faculty,
      String confirmPassword,
      String phone) async {
    print("signuo clicked");
    final response = await http.post(
      Uri.parse('$url/api/auth/signup'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "gender": gender,
        "faculty": faculty,
        "password": password,
        "confirmPassword": confirmPassword,
        "phone_number": phone
      }),
    );
    var res = jsonDecode(response.body);
    print("signUp");
    if (response.statusCode == 200) {
      return [true, res];
    } else {
      print(response.body);
      return [false, res];
    }
  }

  Future<List<Object>> verificationCode(
      String email, String verification_code) async {
    print(verification_code);

    final response = await http.patch(
      Uri.parse('$url/api/auth/validateEmail'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body:
          jsonEncode({"email": email, "verification_code": verification_code}),
    );
    var res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      String accessToken = res['accessToken'];
      print('Access Token: $accessToken');
      saveString(accessToken, "accessTokenKey");

      return [true, res];
    } else {
      return [false, res];
    }
  }

  Future<List<Object>> resendEmail(String email) async {
    final response = await http.post(
      Uri.parse('$url/api/auth/resendEmail'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'email': email, "type": "email"}),
    );
    var res = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return [true, res];
    } else {
      return [false, res];
    }
  }

  Future<List<Object>> createARide(
      String startPoint,
      String destination,
      String carId,
      String time,
      double profit,
      bool foodAllowed,
      bool petAllowed,
      int capacity,
      bool smokingAllowed,
      String riderGender) async {
    String token = sharedPrefenrece.getString("accessTokenKey") ?? "";
    final response = await http.post(
      Uri.parse('$url/api/ride/rides'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      },
      body: jsonEncode({
        "startPoint": startPoint,
        "destination": destination,
        "carId": carId,
        "time": time,
        "profit": profit,
        "preferences": {
          "foodAllowed": foodAllowed,
          "petAllowed": petAllowed,
          "capacity": capacity,
          "smokingAllowed": smokingAllowed,
          "riderGender": riderGender
        }
      }),
    );
    var res = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return [true, res];
    } else {
      return [false, res];
    }
  }

  Future<List<Object>> addCar(
    String color,
    String plate_number,
    String capacity,
    String model,
  ) async {
    String token = sharedPrefenrece.getString("accessTokenKey") ?? "";
    final response = await http.post(
      Uri.parse('$url/api/car/cars'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      },
      body: jsonEncode({
        "color": color,
        "plate_number": plate_number,
        "capacity": capacity,
        "model": model
      }),
    );
    var res = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return [true, res];
    } else {
      return [false, res];
    }
  }

  Future<List<Object>> AcceptOrRejectPassenger(
      String rideId, String passengerId, String status) async {
    String token = sharedPrefenrece.getString("accessTokenKey") ?? "";
    final response = await http.post(
      Uri.parse('$url/api/ride/AcceptOrRejectPassenger'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      },
      body: jsonEncode(
          {"rideId": rideId, "passengerId": passengerId, "decision": status}),
    );
    var res = jsonDecode(response.body);

    print(res);

    if (response.statusCode == 200) {
      return [true, res];
    } else {
      return [false, res];
    }
  }

  Future<InfoModel> getInfo() async {
    String token = sharedPrefenrece.getString("accessTokenKey") ?? "";
    final response = await http.post(
      Uri.parse('$url/api/profile/getInfo'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return InfoModel.fromJson(json);
    } else {
      throw Exception('Failed to load cars');
    }
  }

  Future<RideModel> getRidesByDriverId() async {
    String token = sharedPrefenrece.getString("accessTokenKey") ?? "";
    final response = await http.get(
      Uri.parse('$url/api/ride/getRidesByDriverId'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json);
      return RideModel.fromJson(json);
    } else {
      throw Exception('Failed to load cars');
    }
  }

  Future<List<Object>> addlisense(
      dateCreated, expirationDate, vehicleClass, _imageFile) async {
    String token = sharedPrefenrece.getString("accessTokenKey") ?? "";
    final licensesUrl = Uri.parse('$url/api/car/licenses');
    final request = http.MultipartRequest('POST', licensesUrl)
      ..headers['Authorization'] = 'Bearer $token'
      ..fields['dateCreated'] = dateCreated
      ..fields['expirationDate'] = expirationDate
      ..fields['vehicleClass'] = vehicleClass
      ..files.add(await http.MultipartFile.fromPath('image', _imageFile.path));

    try {
      final response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        print('License information added successfully.');
        return [true, response.body];
      } else {
        print('Failed to add license information: ${response.body}');
        return [false, response.body];
      }
    } catch (e) {
      print('Failed to add license information: $e');
      return [false, e];
    }
  }
}

Future<void> saveString(String value, String key) async {
  await sharedPrefenrece.setString(key, value);
}
