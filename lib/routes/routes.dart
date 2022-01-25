import 'package:flutter/material.dart';
import 'package:pickit/models/vehicles_model.dart';
import 'package:pickit/pages/pages.dart';

const String homePage       = 'home';
const String carDetailsPage = 'carDetails';
const String newCarPage     = 'newCar';
const String newOwnerPage   = 'newOwner';
const String newServicePage = 'newService';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case carDetailsPage:
      return MaterialPageRoute(builder: (context) => CarDetails(
        vehicle: settings.arguments as Vehicle,
      ));
    case newCarPage:
      return MaterialPageRoute(builder: (context) => const NewCar());
    case newOwnerPage:
      return MaterialPageRoute(builder: (context) => const NewOwner());
    case newServicePage:
      return MaterialPageRoute(builder: (context) => NewServicePage(
        vehicle: settings.arguments as Vehicle,
      ));
    default:
      return MaterialPageRoute(builder: (context) => const HomePage());
  }
}