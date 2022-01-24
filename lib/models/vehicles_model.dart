import 'dart:convert';

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));

String vehicleToJson(Vehicle data) => json.encode(data.toJson());

class Vehicle {
  Vehicle({
    required this.brand,
    required this.model,
    required this.year,
    required this.patent,
    required this.color,
    required this.owner,
  });

  String brand;
  String model;
  int year;
  String patent;
  String color;
  Owner owner;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    brand: json["brand"],
    model: json["model"],
    year: json["year"],
    patent: json["patent"],
    color: json["color"],
    owner: Owner.fromJson(json["owner"]),
  );

  Map<String, dynamic> toJson() => {
    "brand": brand,
    "model": model,
    "year": year,
    "patent": patent,
    "color": color,
    "owner": owner.toJson(),
  };
}

class Owner {
  Owner({
    required this.name,
    required this.lastName,
    required this.docNumber,
    required this.phone,
  });

  String name;
  String lastName;
  int docNumber;
  int phone;

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
