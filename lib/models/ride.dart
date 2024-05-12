class Ride {
  final String rideId;
  final String driverId;
  final DateTime time;
  final String startLocation;
  final String endLocation;
  final bool smokeAllowed;
  final bool petsAllowed;
  final bool foodAllowed;
  final int passengerCount;
  final String gender;

  Ride({
    required this.rideId,
    required this.driverId,
    required this.time,
    required this.startLocation,
    required this.endLocation,
    this.smokeAllowed = false,
    this.petsAllowed = false,
    this.foodAllowed = false,
    required this.passengerCount,
    required this.gender,
  });

  //  Ride instance -> json
  Map<String, dynamic> toJson() {
    return {
      'rideId': rideId,
      'driverId': driverId,
      'time': time.toIso8601String(),
      'startLocation': startLocation,
      'endLocation': endLocation,
      'smokeAllowed': smokeAllowed,
      'petsAllowed': petsAllowed,
      'foodAllowed': foodAllowed,
      'passengerCount': passengerCount,
      'gender': gender,
    };
  }

  // json -> instance
  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      rideId: json['rideId'],
      driverId: json['driverId'],
      time: DateTime.parse(
          json['time']), // Deserialize DateTime from ISO-8601 string
      startLocation: json['startLocation'],
      endLocation: json['endLocation'],
      smokeAllowed: json['smokeAllowed'],
      petsAllowed: json['petsAllowed'],
      foodAllowed: json['foodAllowed'],
         passengerCount: json['passengerCount'],
gender: json['gender'],
    );
  }
}
