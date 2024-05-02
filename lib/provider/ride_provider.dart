import 'package:flutter/foundation.dart';
import 'package:senior_project_ruccab/models/ride.dart';
import 'package:senior_project_ruccab/utils/ride_services.dart';


class RideProvider with ChangeNotifier {
  final RideService _rideService = RideService();
  List<Ride> _rides = [];
  bool _isLoading = false;

  List<Ride> get rides => _rides;
  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

Future<void> fetchAllRides() async {
    setLoading(true);
    try {
      _rides = await _rideService.fetchAllRides();
      setLoading(false);
    } catch (e) {
      setLoading(false);
      throw Exception('Failed to fetch all rides: $e');
    }
  }
  
  Future<void> fetchRidesByDestination(String destination) async {
    setLoading(true);
    _rides = await _rideService.fetchRidesByDestination(destination);
    setLoading(false);
  }

  Future<bool> addRide(Ride ride) async {
    bool result = await _rideService.createRide(ride);
    if (result) {
      _rides.add(ride);
      notifyListeners();
    }
    return result;
  }
}
