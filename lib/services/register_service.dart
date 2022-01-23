import 'package:flutter/material.dart';
import 'package:pickit/models/new_owner_model.dart';
import 'package:pickit/services/services.dart';

class RegisterService with ChangeNotifier {

  bool _isLoading = false;
  static DioInstance requests = DioInstance();

  get isLoading => _isLoading;

  registerNewOwner(Map<String, dynamic> data) async {

    _isLoading = true;
    notifyListeners();

    try {
      final res = await requests.postMethod('', {"asd": 123});
      if(res.status != "ERR"){
        return; //NewOwnerModel.fromJson(Map<String, dynamic>.from(res.data[0]));
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