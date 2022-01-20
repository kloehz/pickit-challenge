import 'package:flutter/material.dart';

class OwnerProvider with ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String subName = '';
  int phone = 0;
  String brand = '';
  String model = '';
  int year = 0;
  String patent = '';
  String color = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading( bool state ) {
    _isLoading = state;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}