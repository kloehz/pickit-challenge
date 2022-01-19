import 'package:flutter/material.dart';
import 'package:pickit/routes/routes.dart';
import 'package:pickit/themes/main_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick It',
      routes: getRoutes(),
      initialRoute: 'home',
      theme: mainTheme()
    );
  }
}