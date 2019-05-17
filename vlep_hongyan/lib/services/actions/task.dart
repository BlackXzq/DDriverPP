import 'dart:async';
import 'package:meta/meta.dart';

import '../base_services.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

class TaskRequest {

  static Future getScheduls({
    @required String driverStatus,
    @required String pageNo,
    int pageSize,
    String scheduleNumber,
    void Function(List<ScheduleEntity>) onSucceed,
    void Function(NoticeEntity) onFailed
  }) async {
    final response = await VLEPServices().post(
      '/vlep-business//hydriverApp/selectScheduleInfoByStatus',
      data: {
        'driverStatus': driverStatus,
        'pageNo': pageNo,
        'pageSize': pageSize ?? 10,
        'scheduleNumber': scheduleNumber ?? '',
      },
    );

    if (response.repCode == 200) {
      final schedules = Schedule.fromJson(response.repData);
      if (onSucceed != null) onSucceed(schedules.list);
      VLEPToast.showToast(msg: response.repMsg);
    } else {
      if (onFailed != null) onFailed(NoticeEntity(message: response.repMsg));
    }
  }

}