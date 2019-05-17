export 'config.dart';
export 'theme.dart';
export 'user_manager.dart';
export 'josn_serialization.dart';
export 'print_log.dart';
export 'toast.dart';

import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'user_manager.dart';
import 'print_log.dart';


String Md5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}

void LogInfo(dynamic message) {
  VLEPLog().logInfo(message);
}

void Logout(BuildContext context) {
  ShareUserManager().deleteUserEntity();
  Navigator.of(context, rootNavigator: true).pushReplacementNamed('/login');
}

AppBar buildCustomAppBar() {
  return AppBar(

  );
}



