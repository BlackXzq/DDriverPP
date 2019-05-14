import 'dart:async';
import 'package:meta/meta.dart';

import '../base_services.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';


class LoginRequest {

  static Future sendMessage({
    @required String phoneNum,
    void Function(String) onSucceed,
    void Function(NoticeEntity) onFailed
  }) async {

    final response = await VLEPServices().post(
      '/auth-business/auth/sms/sendCode',
      data: {
        'mobile': phoneNum
      },
    );

    if (response.repCode == 200) {
      final messageId = response.repData['msg_id'];
      if (onSucceed != null) onSucceed(messageId);
      VLEPToast.showToast(msg: response.repMsg);
    } else {
      if (onFailed != null) onFailed(NoticeEntity(message: response.repMsg));
    }
  }

  static Future<UserEntity> messageCodeLogin({
    @required String phoneNum,
    @required String msgId,
    @required String msgCode,
    void Function(UserEntity) onSucceed,
    void Function(NoticeEntity) onFailed
  }) async {

    final response = await VLEPServices().post(
      '/auth-business/auth/sms/mobile/login',
      data: {
        'mobile': phoneNum,
        'code': msgCode,
        'msgId': msgId
      },
    );

    if (response.repCode == 200) {
      final user = UserEntity.fromJson(response.repData);
      ShareUserManager().saveUserEntity(user);
      if (onSucceed != null) onSucceed(user);
    } else {
      if (onFailed != null) onFailed(NoticeEntity(message: response.repMsg));
    }
  }

  static Future<UserEntity> passWordLogin({
    @required String phoneNum,
    @required String password,
    void Function(UserEntity) onSucceed,
    void Function(NoticeEntity) onFailed
  }) async {

    final response = await VLEPServices().post(
      '/auth-business/auth/sms/mobile/login',
      data: {
        'mobile': phoneNum,
        'password': Md5(password),
        'loginType': '1'
      },
    );

    if (response.repCode == 200) {
      final user = UserEntity.fromJson(response.repData);
      ShareUserManager().saveUserEntity(user);
      if (onSucceed != null) onSucceed(user);
    } else {
      if (onFailed != null) onFailed(NoticeEntity(message: response.repMsg));
    }
  }

}