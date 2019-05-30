import 'package:flutter/material.dart';


class OrderDetailPage extends StatefulWidget {
  final String driverId;
  final String tknum;
  final bool isDetail;

  OrderDetailPage({
    Key key,
    @required this.driverId,
    @required this.tknum,
    @required this.isDetail
  }): super(key: key);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isDetail ? '油票详情' : '修改油票信息'
        ),
      ),
      body: Center(
        child: Text('tknum: ${widget.tknum}  driverId: ${widget.driverId}'),
      ),
    );
  }
}
