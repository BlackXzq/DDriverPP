import 'dart:async';
import 'package:meta/meta.dart';

import '../base_services.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

class SchedulsRequest {

  static Future getScheduls({
    @required String pageNo,
    String pageSize,
    String scheduleNumber,
    @required String driverStatus,
    void Function(String) onSucceed,
    void Function(NoticeEntity) onFailed
  }) async {
    final response = await VLEPServices().post(
      '/vlep-business/shipping/schedules',
      data: {
        'pageNo': pageNo,
        'pageSize': pageSize ?? '10',
        'scheduleNumber': scheduleNumber ?? '',
        'driverStatus': driverStatus
      },
    );

    if (response.repCode == 200) {
      final list = response.repData['list'];
      print('+++++++++++++++++++++++++++++');
      print(list);
      print('+++++++++++++++++++++++++++++');
      if (onSucceed != null) onSucceed(response.repMsg);
      VLEPToast.showToast(msg: response.repMsg);
    } else {
      if (onFailed != null) onFailed(NoticeEntity(message: response.repMsg));
    }
  }

}