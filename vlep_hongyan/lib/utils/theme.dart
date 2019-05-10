import 'package:flutter/material.dart';
import 'config.dart';

class VLEPTheme {
  static const double paddingSizeSmall = 4;
  static const double paddingSizeNormal = 8;
  static const double paddingSizeLarge = 16;

  static const double marginSizeSmall = 4;
  static const double marginSizeNormal = 8;
  static const double marginSizeLarge = 16;

  static const double fontSizeSmall = 12;
  static const double fontSizeNormal = 14;
  static const double fontSizeLarge = 16;

  static const fontWeightLight = FontWeight.w200;
  static const fontWeightNormal = FontWeight.w500;
  static const fontWeightHeavy = FontWeight.w700;

  static get whiteLight => Colors.white;
  static get whiteNormal => Colors.white70;
  static get whiteDark => Colors.white30;


  static get titleColor => Color(0xFF333333); //标题颜色
  static get bodyColor => Color(0xFF3A3A3A); //正文颜色
  static get decColor => Color(0xFF999999);//内容是描述颜色
  static get primaryColor => Color(0xFF7192FD); //button 背景等主题颜色
  
  static get blackLighter => Colors.black26;
  static get blackLight => Colors.black54;
  static get blackNormal => Colors.black87;
  static get blackDark => Colors.black;

  static get greyLight => Colors.grey[200];
  static get greyNormal => Colors.grey[500];
  static get greyDark => Colors.grey[700];

  static ThemeData _theme;
  static ThemeData get theme {
    if (_theme == null || VLEPConfig.debug) {
      _theme = ThemeData(
        primarySwatch: Colors.lightBlue,
        brightness: Brightness.light,
        buttonColor: primaryColor,
      );
    }
    return _theme;
  }
}