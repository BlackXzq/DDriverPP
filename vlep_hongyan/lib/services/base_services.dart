import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utils/utils.dart';

part 'base_services.g.dart';

@JsonSerializable()
@immutable
class ApiResponse {
  final int repCode;
  final String repMsg;
  final Map<String, dynamic> repData;

  ApiResponse({
    this.repCode = 0,
    this.repMsg = "",
    this.repData,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

}

class VLEPServices {
  final _client = Dio();

  VLEPServices() {
    _client.options.baseUrl = VLEPConfig.baseUrl;
  }

  Future<ApiResponse> request(
    String method,
    String path,
    {
    dynamic data
    }
  ) async {

    var token = ShareUserManager.userEntity.token;
    var userId = ShareUserManager.userEntity.userId;
    var username = ShareUserManager.userEntity.username;
    var sign = ShareUserManager.userEntity.token;
    var time = (DateTime.now().millisecondsSinceEpoch).toString();
    var baseParams = Map<String, dynamic>();
    baseParams['reqData'] = data;
    baseParams['token'] = token;
    baseParams['userId'] = userId;
    baseParams['username'] = username;
    baseParams['sign'] = _getSign(data, time, token);
    baseParams['time'] = time;
    _client.options.method = method;
    var response = Response();

    try {
      print("try: ${baseParams}");
      response = await _client.request(
        path,
        data: baseParams
      );
    } catch (e) {
      print("catch: ${e.message}");
      return ApiResponse(
        repCode: -1,
        repMsg: 'DioError: ${e.type} ${e.message}',
      );
    }
    print("params: ${baseParams}");
    if (response.statusCode == HttpStatus.ok) {
      print('success: ${response.data}');
      return ApiResponse.fromJson(response.data);
    } else {
      print('error: ${response.statusCode.toString()}');
      return ApiResponse(
        repCode: -1,
        repMsg: response.statusCode.toString(),
      );
    }
  }

  //生成签名
  String _getSign(dynamic repData, String timeStr, String tokenStr) {
    final data = jsonLiteralAsDart(repData);
    final sign = "reqData" + data + "time" + timeStr + "token" + tokenStr;
    return Md5(sign);
  }

  Future<ApiResponse> get(String path, {Map<String, dynamic> data}) async {
    return request('GET', path, data: data);
  }

  Future<ApiResponse> post(String path, {Map<String, dynamic> data}) async {
    return request('POST', path, data: data);
  }

  Future<ApiResponse> postForm(String path, {FormData data}) async {
    return request('POST', path, data: data);
  }

}

