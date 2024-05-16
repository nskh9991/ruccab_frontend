class RideModel {
  List<Data>? data;
  int? totalRides;
  int? totalPages;

  RideModel({this.data, this.totalRides, this.totalPages});

  RideModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    totalRides = json['totalRides'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['totalRides'] = totalRides;
    data['totalPages'] = totalPages;
    return data;
  }
}

class Data {
  Preferences? preferences;
  String? id;
  String? startPoint;
  String? destination;
  String? date;
  int? profit;
  String? time;
  bool? completed;
  String? driverId;
  String? carId;
  List<String>? passengers;
  List<String>? pendingPassengers;
  int? iv;

  Data({
    this.preferences,
    this.id,
    this.startPoint,
    this.destination,
    this.date,
    this.profit,
    this.time,
    this.completed,
    this.driverId,
    this.carId,
    this.passengers,
    this.pendingPassengers,
    this.iv,
  });

  Data.fromJson(Map<String, dynamic> json) {
    preferences = json['preferences'] != null
        ? Preferences.fromJson(json['preferences'])
        : null;
    id = json['_id'];
    startPoint = json['startPoint'];
    destination = json['destination'];
    date = json['date'];
    profit = json['profit'];
    time = json['time'];
    completed = json['completed'];
    driverId = json['driverId'];
    carId = json['carId'];
    passengers = List<String>.from(json['passengers'] ?? []);
    pendingPassengers = List<String>.from(json['pendingPassengers'] ?? []);
    iv = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (preferences != null) {
      data['preferences'] = preferences!.toJson();
    }
    data['_id'] = id;
    data['startPoint'] = startPoint;
    data['destination'] = destination;
    data['date'] = date;
    data['profit'] = profit;
    data['time'] = time;
    data['completed'] = completed;
    data['driverId'] = driverId;
    data['carId'] = carId;
    data['passengers'] = passengers;
    data['pendingPassengers'] = pendingPassengers;
    data['__v'] = iv;
    return data;
  }
}

class Preferences {
  bool? foodAllowed;
  bool? petAllowed;
  int? capacity;
  bool? smokingAllowed;
  String? riderGender;

  Preferences({
    this.foodAllowed,
    this.petAllowed,
    this.capacity,
    this.smokingAllowed,
    this.riderGender,
  });

  Preferences.fromJson(Map<String, dynamic> json) {
    foodAllowed = json['foodAllowed'];
    petAllowed = json['petAllowed'];
    capacity = json['capacity'];
    smokingAllowed = json['smokingAllowed'];
    riderGender = json['riderGender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['foodAllowed'] = foodAllowed;
    data['petAllowed'] = petAllowed;
    data['capacity'] = capacity;
    data['smokingAllowed'] = smokingAllowed;
    data['riderGender'] = riderGender;
    return data;
  }
}
