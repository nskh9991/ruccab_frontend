import 'dart:convert';

class User {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String gender;
  final String faculty;
  final String confirmPassword;

  User({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.faculty,
    required this.confirmPassword,
  });

  // Factory constructor to create a User from a map.
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      password: map['password'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      gender: map['gender'],
      faculty: map['faculty'],
      confirmPassword: map['confirmPassword'],
    );
  }

  // Converts a User instance to a map.
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'faculty': faculty,
      'confirmPassword': confirmPassword,
    };
  }

  //  User instance -> JSON 
  String toJson() => json.encode(toMap());

  //  User from a JSON 
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
