import 'package:flutter/material.dart';
import 'package:pickit/models/vehicles_model.dart';
import 'package:pickit/services/services.dart';
class GetVehicles with ChangeNotifier {

  bool _isLoading = false;
  List<Vehicle> vehiclesList = [];
  static DioInstance requests = DioInstance();

  GetVehicles() {
    getVehiclesList();
    
  }

  get isLoading => _isLoading;

  getVehiclesList() async {

    _isLoading = true;
    notifyListeners();

    try {
      final res = await requests.getMethod('');

      if(res.status != 'ERR'){
      List<Vehicle> owners  = List<Vehicle>.from(
        res.data.map((x) => Vehicle.fromJson(Map<String, dynamic>.from(x)))
      );

      vehiclesList.addAll(owners);
      } else {
        throw res.msg;
      }
    } catch (err) {
      if( err.runtimeType == String ){
        rethrow;
      } else {
       throw 'A Ocurrido un error';
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}