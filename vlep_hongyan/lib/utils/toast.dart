import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:flutter/material.dart';


class VLEPToast {

  static Future<bool> cancel() async {
    return Fluttertoast.cancel();
  }

  static Future<bool> showToast({
    @required String msg,
    int times = 1,
    double fontSize = 16.0,
    ToastGravity gravity = ToastGravity.CENTER,
    Color backgroundColor,
    Color textColor,
  }) async {

    return Fluttertoast.showToast(
      msg: msg,
      gravity: gravity,
      timeInSecForIos: times,
      fontSize: fontSize,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
      textColor: textColor
    );
  }
}