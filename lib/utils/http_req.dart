import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:senior_project_ruccab/screens/auth/verification_screen.dart';

String url = "https://ruccab-backend.onrender.com";

class HttpRequests {
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
      return [true, res ['accessToken']];

    } else {
  
      return [false, res['message']];
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
      return [true, res['message']];
    } else {
      print(response.body);
      return [false, res['message']];
    }
  }

  Future<List<Object>> verificationCode(
      String email, String verification_code) async {
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
      return [true, res['accessToken']];
    } else {
      print(response.body);
      return [false, res['message']];
    }
  }
}
