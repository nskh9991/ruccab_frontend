class vehicle {
    final String plateNumber;

  final String ownerID;
  final String color;
  final String model;

  vehicle({
        required this.plateNumber,

    required this.ownerID,
    required this.color,
    required this.model,
  });

  Map<String, dynamic> toJson() {
    return {
      'plateNumber': plateNumber,

      'ownerID':ownerID,
      'color': color,
      'model': model,
    };
  }

  // json -> instance
  factory vehicle.fromJson(Map<String, dynamic> json) {
    return vehicle(
      plateNumber: json['plateNumber'],

      ownerID: json['ownerID'],
      color: json['color'],
      model: json['model'],
    );
  }
}
