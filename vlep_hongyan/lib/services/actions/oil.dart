import 'dart:async';
import 'package:meta/meta.dart';

import '../base_services.dart';
import '../../models/models.dart';
import '../../utils/utils.dart';

class OilRequest {

  static Future getOilOrderList({
    @required int pageNo,
    int pageSize,
    void Function(List<OilOrderEntity>) onSucceed,
    void Function(NoticeEntity) onFailed
  }) async {
    final response = await VLEPServices().MapPost(
      '/vlep-business/api/oilCouponMessage/oilCouponTknumList',
      data: {
        'pageNo': pageNo ?? 1,
        'pageSize': pageSize ?? 10,
      },
    );

    if (response['repCode'] == 200) {
      List<OilOrderEntity> orderList = [];
      orderList = (response['repData'] as List)?.map((e) => e == null ? null : OilOrderEntity.fromJson(e as Map<String, dynamic>))
          ?.toList();
      if (onSucceed != null) onSucceed(orderList);
    } else {
      if (onFailed != null) onFailed(NoticeEntity(message: response['repMsg']));
    }
  }
}