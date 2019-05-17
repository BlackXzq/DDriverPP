import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import '../models/user.dart';

const String userIdKey = 'VLEPUserIdKey';
const String tokenKey = 'VLEPUTokenKey';
const String usernameKey = 'VLEPUsernameKey';
const String typeKey = 'VLEPTypeKey';
const String customerTypeKey = 'VLEPCustomerTypeKey';

class ShareUserManager {
  static ShareUserManager _instance;
  ShareUserManager._();
  UserEntity _user = UserEntity();

  factory ShareUserManager() {
    if (_instance == null) {
      _instance = ShareUserManager._();
    }
    return _instance;
  }

  //存储 user 信息
  void saveUserEntity(UserEntity user) async {
    _user = user;

    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(userIdKey, user.userId);
    prefs.setString(tokenKey, user.token);
    prefs.setString(usernameKey, user.username);
    prefs.setInt(typeKey, user.type);
    prefs.setInt(customerTypeKey, user.customerType);
  }
  //退出登录时候 删除用户信息
  void deleteUserEntity() async {
    final user = UserEntity();
    saveUserEntity(user);
  }

  Future<UserEntity> getUserEntity() async {

    if (_user.token.isNotEmpty) {
      return _user;
    }

    final prefs = await SharedPreferences.getInstance();
    UserEntity user = UserEntity();
    user.userId = prefs.getInt(userIdKey) ?? -1;
    user.token = prefs.getString(tokenKey) ?? '';
    user.username = prefs.getString(usernameKey) ?? '';
    user.type = prefs.getInt(typeKey) ?? -1;
    user.customerType = prefs.getInt(customerTypeKey) ?? -1;
    _user = user;
    return user;
  }


}