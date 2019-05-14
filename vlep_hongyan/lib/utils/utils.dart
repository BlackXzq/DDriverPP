export 'config.dart';
export 'theme.dart';
export 'user_manager.dart';
export 'josn_serialization.dart';

export 'toast.dart';

import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';


String Md5(String data) {
  var content = new Utf8Encoder().convert(data);
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}




