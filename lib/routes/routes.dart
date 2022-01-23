import 'package:flutter/material.dart';
import 'package:pickit/pages/pages.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    'home': (context) => const HomePage(),
    'carDetails': ( _ ) => const CarDetails(),
    'newCar': ( _ ) => const NewCar(),
    'newOwner': ( _ ) => const NewOwner(),
    'newService': ( _ ) => const NewServicePage(),
  };
}