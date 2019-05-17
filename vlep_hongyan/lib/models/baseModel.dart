
import 'dart:convert' show json;

class BaseModel {
  int code;
  String message;

  BaseModel.fromJson(Map<String, dynamic> json)
    : code = json['code'],
      message = json['message'];
}