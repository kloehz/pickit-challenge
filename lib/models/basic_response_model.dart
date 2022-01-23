import 'dart:convert';

class BasicResponse {
  String status;
  String msg;
  dynamic data;

  BasicResponse({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory BasicResponse.fromJson(String str) {
    return BasicResponse.fromMap(json.decode(str));
  }

  factory BasicResponse.fromMap(Map<String, dynamic> json) {
    return BasicResponse(
      status: json['status'],
      msg: json['msg'],
      data: json['data'],
    );
  }
}