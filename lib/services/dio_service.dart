import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'package:pickit/models/basic_response_model.dart';

class DioInstance extends ChangeNotifier {

  static const String _baseUrl = "http://localhost:9000/api/items";
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
      data: jsonEncode(data)
    );

    return BasicResponse.fromMap(Map<String, dynamic>.from(response.data));
  }
 
   Future<BasicResponse> getMethod(String path) async {
    Response response = await dio.get('$_baseUrl$path');
    return BasicResponse.fromMap(Map<String, dynamic>.from(response.data));
  }
}
