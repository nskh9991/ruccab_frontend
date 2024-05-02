import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    email: '',
    password: '',
    firstName: '',
    lastName: '',
    gender: '',
    faculty: '',
    confirmPassword: '',
  );

  User get user => _user;

  void setUser(String json) {
    _user = User.fromJson(json);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
