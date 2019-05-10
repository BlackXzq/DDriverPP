import 'package:package_info/package_info.dart';
import 'dart:async';


enum AJNetworkDebugMode {
  producter, //线上生产环境
  staging,       //预发环境
  tester,          // 测试环境
  developer      // 开发环境
}

class VLEPConfig {

  static var servicesDebugMode = AJNetworkDebugMode.developer; //网络服务请求环境配置
  static var debug = false; //log、mock数据等。。。调试开关配置
  static PackageInfo packageInfo; //获取包信息

  static var isLogined = false;

  static get baseUrl {
    switch (servicesDebugMode) {
      case AJNetworkDebugMode.producter:
        return 'https://www.anji-eql.com/api/';
      case AJNetworkDebugMode.staging:
        return 'http://prod-elb-vlep-1225676083.cn-north-1.elb.amazonaws.com.cn/apiuat/';
      case AJNetworkDebugMode.tester:
        return 'http://10.108.6.78:38060/';
      case AJNetworkDebugMode.developer:
        return 'http://10.108.6.77:38060/';
      default:
        return 'https://www.anji-eql.com/api/';
    }
  }

}