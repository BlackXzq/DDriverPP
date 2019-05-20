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

    var user = await ShareUserManager().getUserEntity();
    var token = user.token;
    var userId = user.userId;
    var username = user.username;
    var sign = user.token;
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
      LogInfo("try: ${baseParams}");
      response = await _client.request(
        path,
        data: baseParams
      );
    } catch (e) {
      LogInfo("catch: DioError: ${e.type} ${e.message}");
      return ApiResponse(
        repCode: -1,
        repMsg: '网络异常，请检查网络连接',
      );
    }
    if (response.statusCode == HttpStatus.ok) {
      LogInfo('success: ${response.data}');
      return ApiResponse.fromJson(response.data);
    } else {
      LogInfo('error: ${response.statusCode.toString()}');
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

