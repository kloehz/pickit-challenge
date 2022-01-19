import 'package:flutter/material.dart';
import 'package:pickit/themes/colors.dart';

ThemeData mainTheme() {
  return ThemeData(
    primaryColor: primaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor
    ),
    appBarTheme: const AppBarTheme(backgroundColor: primaryColor)
  );
}