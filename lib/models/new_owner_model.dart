import 'dart:convert';

import 'package:pickit/models/new_vehicle_model.dart';

class NewOwnerModel {
  Owner owner;
  Vehicle vehicle;

  NewOwnerModel({
    required this.owner,
    required this.vehicle,
  });

  factory NewOwnerModel.fromJson(Map<String, dynamic> json) => NewOwnerModel(
    owner: Owner.fromJson(json["owner"]),
    vehicle: Vehicle.fromJson(json["vehicle"]),
  );

  Map<String, dynamic> toJson() => {
    "owner": owner.toJson(),
    "vehicle": vehicle.toJson(),
  };
}

class Owner {
  String name;
  String lastName;
  int docNumber;
  int phone;

  Owner({
    required this.name,
    required this.lastName,
    required this.docNumber,
    required this.phone,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    name: json["name"],
    lastName: json["lastName"],
    docNumber: json["docNumber"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lastName": lastName,
    "docNumber": docNumber,
    "phone": phone,
  };
}

NewOwnerModel newOwnerFromJson(String str) => NewOwnerModel.fromJson(json.decode(str));

String newOwnerToJson(NewOwnerModel data) => json.encode(data.toJson());