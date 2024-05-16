// class vehicle {
//     final String plateNumber;

//   final String ownerID;
//   final String color;
//   final String model;

//   vehicle({
//         required this.plateNumber,

//     required this.ownerID,
//     required this.color,
//     required this.model,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'plateNumber': plateNumber,

//       'ownerID':ownerID,
//       'color': color,
//       'model': model,
//     };
//   }

//   // json -> instance
//   factory vehicle.fromJson(Map<String, dynamic> json) {
//     return vehicle(
//       plateNumber: json['plateNumber'],

//       ownerID: json['ownerID'],
//       color: json['color'],
//       model: json['model'],
//     );
//   }
// }
class CarModel {
  String? sId;
  String? ownerId;
  String? color;
  String? plateNumber;
  int? capacity;
  String? model;
  int? iV;

  CarModel(
      {this.sId,
      this.ownerId,
      this.color,
      this.plateNumber,
      this.capacity,
      this.model,
      this.iV});

  CarModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ownerId = json['owner_id'];
    color = json['color'];
    plateNumber = json['plate_number'];
    capacity = json['capacity'];
    model = json['model'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['owner_id'] = ownerId;
    data['color'] = color;
    data['plate_number'] = plateNumber;
    data['capacity'] = capacity;
    data['model'] = model;
    data['__v'] = iV;
    return data;
  }
}
