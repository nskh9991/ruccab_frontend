import 'package:flutter/material.dart';
import 'package:senior_project_ruccab/main.dart';
import 'package:senior_project_ruccab/models/info_model.dart';
import 'package:senior_project_ruccab/models/ride_model.dart';
import 'package:senior_project_ruccab/models/user.dart';

class UserProvider extends ChangeNotifier {
  InfoModel userinfo = InfoModel();
  RideModel myRides = RideModel();

  bool isLoading = false;
  void setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  Future<void> fetchInfo() async {
    setLoading(true);
    try {
      userinfo = await httpRequest.getInfo();
      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw Exception('Failed to fetch profile: $e');
    }
  }

  Future<void> fetchMyRides() async {
    setLoading(true);
    try {
      myRides = await httpRequest.getRidesByDriverId();
      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw Exception('Failed to fetch profile: $e');
    }
  }

  Future<List<Object>> AcceptOrRejectPassenger(
      String rideId, String passengerId, String status) async {
    setLoading(true);
    try {
      print("---------------------------------");
      var res = await httpRequest.AcceptOrRejectPassenger(
          rideId, passengerId, status);
      print("---------------------------------");

      setLoading(false);
      return res;
    } catch (e) {
      setLoading(false);
      throw Exception('Failed to fetch profile: $e');
    }
  }

  // void setUser(String json) {
  //   _user = User.fromJson(json);
  //   notifyListeners();
  // }

  // void setUserFromModel(User user) {
  //   _user = user;
  //   notifyListeners();
  // }
}
