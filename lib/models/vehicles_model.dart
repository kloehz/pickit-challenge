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
    required this.lastService
  });

  String brand;
  String model;
  int year;
  String patent;
  String color;
  Owner owner;
  LastService lastService;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    brand: json["brand"],
    model: json["model"],
    year: json["year"],
    patent: json["patent"],
    color: json["color"],
    lastService: LastService.fromJson(json["lastService"]),
    owner: Owner.fromJson(json["owner"]),
  );

  Map<String, dynamic> toJson() => {
    "brand": brand,
    "model": model,
    "year": year,
    "patent": patent,
    "color": color,
    "owner": owner.toJson(),
    "lastService": lastService.toJson()
  };
}

class LastService {

  ServiceDescription aceite;
  ServiceDescription filtro;
  ServiceDescription correa;
  ServiceDescription general;
  ServiceDescription pintura;
  ServiceDescription otro;

  LastService({
    required this.aceite,
    required this.filtro,
    required this.correa,
    required this.general,
    required this.pintura,
    required this.otro,
  });

  factory LastService.fromJson(Map<String, dynamic> json) => LastService(
    aceite: ServiceDescription.fromJson(json["aceite"]),
    filtro: ServiceDescription.fromJson(json["filtro"]),
    correa: ServiceDescription.fromJson(json["correa"]),
    general: ServiceDescription.fromJson(json["general"]),
    pintura: ServiceDescription.fromJson(json["pintura"]),
    otro: ServiceDescription.fromJson(json["otro"]),
  );

  Map<String, ServiceDescription> toJson() => {
    "aceite": aceite,
    "filtro": filtro,
    "correa": correa,
    "general": general,
    "pintura": pintura,
    "otro": otro
  };
}

class ServiceDescription {
  String description;
  bool state;

  ServiceDescription({
    required this.description,
    required this.state
  });

  factory ServiceDescription.fromJson(Map<String, dynamic> json) => ServiceDescription(
    description: json["description"],
    state: json["state"]
  );

  Map<String, dynamic> toJson() => {
    "description": description,
    "state": state
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
