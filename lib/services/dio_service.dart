import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:pickit/models/basic_response_model.dart';

class DioInstance extends ChangeNotifier {

  static const String _baseUrl = "https://app.fakejson.com/q";
  static late Dio dio;
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: _baseUrl
  );

  DioInstance() {
    dio = Dio(baseOptions);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions option, handler) async {
        final headers = {
          "Content-Type": "application/json; charset=UTF-8",
        };
        option.headers.addAll(headers);
        return handler.next(option);
      },
    ));
  }

  Future<BasicResponse> postMethod(String path, Map<String, dynamic> data) async {

    Response response = await dio.post(
      path,
      data: jsonEncode(dataTest)
    );

    return BasicResponse.fromMap(Map<String, dynamic>.from(response.data));
  }
}



final Map<String, dynamic> dataTest = {
  "token": "OKRq-rhKY27ZahCQD5j7Vg",
  "data": {
    "status": "OK",
    "msg": "",
    "data":[
      {
        "owner": {
          "name": "Guido Leonel",
          "lastName": "Cotelesso",
          "docNumber": 37930873,
          "phone": 2477566569
        },
        "vehicle": {
          "brand": "Peugeot",
          "model": "307",
          "year": 2018,
          "patent": "ABC123",
          "color": "#FFFFFF"
        }
      },
      {
        "owner": {
          "name": "Guido Leonel",
          "lastName": "Cotelesso",
          "docNumber": 37930873,
          "phone": 2477566569
        },
        "vehicle": {
          "brand": "Peugeot",
          "model": "307",
          "year": 2018,
          "patent": "ABC123",
          "color": "#FFFFFF"
        }
      },
      {
        "owner": {
          "name": "Guido Leonel",
          "lastName": "Cotelesso",
          "docNumber": 37930873,
          "phone": 2477566569
        },
        "vehicle": {
          "brand": "Peugeot",
          "model": "307",
          "year": 2018,
          "patent": "ABC123",
          "color": "#FFFFFF"
        }
      },
      {
        "owner": {
          "name": "Guido Leonel",
          "lastName": "Cotelesso",
          "docNumber": 37930873,
          "phone": 2477566569
        },
        "vehicle": {
          "brand": "Peugeot",
          "model": "307",
          "year": 2018,
          "patent": "ABC123",
          "color": "#FFFFFF"
        }
      },
      {
        "owner": {
          "name": "Guido Leonel",
          "lastName": "Cotelesso",
          "docNumber": 37930873,
          "phone": 2477566569
        },
        "vehicle": {
          "brand": "Peugeot",
          "model": "307",
          "year": 2018,
          "patent": "ABC123",
          "color": "#FFFFFF"
        }
      },
      {
        "owner": {
          "name": "Guido Leonel",
          "lastName": "Cotelesso",
          "docNumber": 37930873,
          "phone": 2477566569
        },
        "vehicle": {
          "brand": "Peugeot",
          "model": "307",
          "year": 2018,
          "patent": "ABC123",
          "color": "#FFFFFF"
        }
      }
    ]
  }
};