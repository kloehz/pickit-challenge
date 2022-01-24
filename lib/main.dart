import 'package:flutter/material.dart';
import 'package:pickit/services/get_vehicles.dart';
import 'package:pickit/services/register_service.dart';

import 'package:provider/provider.dart';

import 'package:pickit/providers/providers.dart';
import 'package:pickit/routes/routes.dart';
import 'package:pickit/themes/main_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => OwnerProvider()),
        ChangeNotifierProvider(create: ( _ ) => ServicesListProvider()),
        ChangeNotifierProvider(create: ( _ ) => RegisterService()),
        ChangeNotifierProvider(create: ( _ ) => GetVehicles()),
      ],
      child: MaterialApp(
        title: 'Pick It',
        routes: getRoutes(),
        initialRoute: 'home',
        theme: mainTheme()
      ),
    );
  }
}