import 'package:flutter/material.dart';
import '../models/models.dart';
import '../utils/utils.dart';

class WaitSendTask extends StatefulWidget {

  final TaskEntity task;
  Function tapSelectClick;

  WaitSendTask({
    Key key,
    @required this.task,
    this.tapSelectClick
  }) : super(key: key);

  @override
  _WaitSendTaskState createState() => _WaitSendTaskState();
}

class _WaitSendTaskState extends State<WaitSendTask> {

  bool _isSelect = false;

  void _tapContent() {
    if(widget.tapSelectClick != null) {
      widget.tapSelectClick(widget.task.parentScheduleNumber, !_isSelect);
    }
    setState(() {
      _isSelect = !_isSelect;
    });
  }

  Widget _buildTaskNumWidget() {
    return Container(
      padding:  EdgeInsets.only(left: 15, top: 15, right: 15),
      height: 40,
      child: GestureDetector(
        onTap: Feedback.wrapForTap(_tapContent, context),
        child: Row(
          children: <Widget>[
            Image.asset(
              _isSelect
                  ? 'assets/images/public/radio_select.png'
                  : 'assets/images/public/radio_normal.png',
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  '调度单号：${widget.task.parentScheduleNumber}',
                  style: TextStyle(
                      color: VLEPTheme.bodyColor,
                      fontSize: VLEPTheme.fontSizeNormal
                  ),
                ),
              ),
            ),
            Container(
                width: 28,
                height: 24,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: VLEPTheme.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Text(
                  '${widget.task.carTotalNum}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: VLEPTheme.fontSizeNormal
                  ),
                )
            ),
            Text(
              ' 辆车',
              style: TextStyle(
                  color: VLEPTheme.bodyColor,
                  fontSize: VLEPTheme.fontSizeNormal
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _buidlLine() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10,right: 10),
      height: 1,
      color: VLEPTheme.greyLight,
    );
  }

  Widget _buildCityWidget() {
    return Container(
      width: 100,
      margin: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Text(
            '${widget.task.srcCity}',
            style: TextStyle(
              color: Color(0xFFA37DFC),
              fontSize: VLEPTheme.fontSizeNormal,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: Image.network(
              'https://s3.cn-north-1.amazonaws.com.cn/anjiplus-vlep/c2a42e1d5f6c77e1bd41c61e039e083c5769311019352715243.png',
              width: 12,
              height: 23,
            ),
          ),
          Text(
            '${widget.task.destCity}',
            style: TextStyle(
              color: Color(0xFFF9A574),
              fontSize: VLEPTheme.fontSizeNormal
            ),
            textAlign: TextAlign.center,
          )

        ],
      ),
    );
  }

  Widget _buildTransInfoWidget() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Text(
        '计划发车时间：${widget.task.shipmentDate}',
        style: TextStyle(
          color: VLEPTheme.decColor,
          fontSize: VLEPTheme.fontSizeNormal
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final double ScreenW = MediaQuery.of(context).size.width;
    final double ScreenH = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          border: Border.all(color: Color(0xfff2f2f2), width: 1),
          color: Colors.white
        ),
        width: ScreenW,
        child: Column(
          children: <Widget>[
            _buildTaskNumWidget(),
            _buidlLine(),
            Row(
              children: <Widget>[
                _buildCityWidget(),
                Expanded(
                  child: _buildTransInfoWidget(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}