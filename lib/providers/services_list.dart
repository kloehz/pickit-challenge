import 'package:flutter/material.dart';

class ServicesListProvider with ChangeNotifier {

  Map<String, Map<String, dynamic>> servicesList = {
    'aceite': {'description': 'Cambio de aceite', 'state': true},
    'filtro': {'description': 'Cambio de filtro', 'state': false},
    'correa': {'description': 'Cambio de correa', 'state': false},
    'general': {'description': 'Revision general', 'state': true},
    'pintura': {'description': 'Cambio de Pintura', 'state': false},
    'otro': {'description': 'Otros servicios', 'state': true}
  };

  void changeServiceState(String service, Map<String, dynamic> state){
    servicesList[service] = state;
    notifyListeners();
  }
}