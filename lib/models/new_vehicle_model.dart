class Vehicle {

  String brand;
  String model;
  int year;
  String patent;
  String color;

  Vehicle({
    required this.brand,
    required this.model,
    required this.year,
    required this.patent,
    required this.color,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    brand: json["brand"],
    model: json["model"],
    year: json["year"],
    patent: json["patent"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "brand": brand,
    "model": model,
    "year": year,
    "patent": patent,
    "color": color,
  };
}