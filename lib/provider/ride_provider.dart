// import 'package:flutter/foundation.dart';
// import 'package:senior_project_ruccab/models/ride.dart';
// import 'package:senior_project_ruccab/models/ride_model.dart';
// import 'package:senior_project_ruccab/utils/ride_services.dart';

// class RideProvider with ChangeNotifier {
//   final RideService _rideService = RideService();
//   List<Ride> _rides = [];
//   RideModel ridesByDestination = RideModel();
//   bool _isLoading = false;

//   List<Ride> get rides => _rides;
//   bool get isLoading => _isLoading;

//   void setLoading(bool loading) {
//     _isLoading = loading;
//     notifyListeners();
//   }

//   // Future<void> fetchAllRides() async {
//   //   setLoading(true);
//   //   try {
//   //     _rides = await _rideService.fetchAllRides();
//   //     setLoading(false);
//   //   } catch (e) {
//   //     setLoading(false);
//   //     throw Exception('Failed to fetch all rides: $e');
//   //   }
//   // }

//   Future<void> fetchRidesByDestination(String destination) async {
//     setLoading(true);
//     ridesByDestination = await _rideService.fetchRidesByDestination(destination);
//     setLoading(false);
//   }

//   // Future<bool> addRide(Ride ride) async {
//   //   bool result = await _rideService.createRide(ride);
//   //   if (result) {
//   //     _rides.add(ride);
//   //     notifyListeners();
//   //   }
//   //   return result;
//   // }
// }
import 'package:flutter/foundation.dart';
import 'package:senior_project_ruccab/models/ride_model.dart';
import 'package:senior_project_ruccab/models/vehicle.dart';
import 'package:senior_project_ruccab/utils/ride_services.dart';

class RideProvider with ChangeNotifier {
  final RideService _rideService = RideService();
  RideModel _rides = RideModel();
  List<CarModel> cars = [];
  bool _isLoading = false;

  RideModel get rides => _rides;
  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> fetchRidesByDestination(String destination) async {
    setLoading(true);
    try {
      _rides = await _rideService.fetchRidesByDestination(destination);

      print(_rides);
      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw Exception('Failed to fetch rides by destination: $e');
    }
  }

  fetchCars() async {
    setLoading(true);
    try {
      cars = await _rideService.fetchCars();
      print(cars);
      notifyListeners();

      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw Exception('Failed to fetch cars: $e');
    }
  }

  Future<List<dynamic>> requestAride(String rideId) async {
    setLoading(true);
    try {
      var response = await _rideService.requestARide(rideId);
      print(response);
      notifyListeners();
      setLoading(false);
      return response;
    } catch (e) {
      setLoading(false);
      throw Exception('Failed to fetch cars: $e');
    }
  }

  Future<List<dynamic>> completeRide(String rideId) async {
    setLoading(true);
    try {
      var response = await _rideService.completeRide(rideId);
      print(response);
      notifyListeners();
      setLoading(false);
      return response;
    } catch (e) {
      setLoading(false);
      throw Exception('Failed to fetch cars: $e');
    }
  }
}
