import 'dart:async';
import 'package:meta/meta.dart';

import '../base_services.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

class TaskRequest {

  static Future getScheduls({
    @required String driverStatus,
    @required int pageNo,
    int pageSize,
    String scheduleNumber,
    void Function(List<TaskEntity>) onSucceed,
    void Function(NoticeEntity) onFailed
  }) async {
    final response = await VLEPServices().post(
      '/vlep-business//hydriverApp/selectScheduleInfoByStatus',
      data: {
        'driverStatus': driverStatus,
        'pageNo': pageNo ?? 1,
        'pageSize': pageSize ?? 10,
        'scheduleNumber': scheduleNumber ?? '',
      },
    );

    if (response.repCode == 200) {
      final tasks = Tasks.fromJson(response.repData);
      if (onSucceed != null) onSucceed(tasks.list);
    } else {
      if (onFailed != null) onFailed(NoticeEntity(message: response.repMsg));
    }
  }

}