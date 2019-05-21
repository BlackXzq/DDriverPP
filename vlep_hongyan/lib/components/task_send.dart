import 'package:flutter/material.dart';

import '../utils/utils.dart';


class TaskSend extends StatefulWidget {
  @override
  _TaskSendState createState() => _TaskSendState();
}

class _TaskSendState extends State<TaskSend> {

  bool _showDetail = false;

  Widget _buildLine() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 1,
      color: VLEPTheme.greyLight,
    );
  }

  Widget _buildTopTransNoWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 24,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: VLEPTheme.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Text(
              '1',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          Expanded(
            child: Text(
              '装运单号：HYKH4867085968665',
              style: _bodyStyle(),
            ),
          )
        ],
      ),
    );
  }

  TextStyle _bodyStyle() {
    return TextStyle(
      color: VLEPTheme.bodyColor,
      fontSize: VLEPTheme.fontSizeNormal,
    );
  }

  TextStyle _descStyle() {
    return TextStyle(
      color: VLEPTheme.decColor,
      fontSize: VLEPTheme.fontSizeSmall,
    );
  }

  Widget _buildVANWidget() {
    return Container(
      padding: EdgeInsets.only(left: 44),
      height: 40,
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              'VAN码：VAN6768008467118',
              style: _bodyStyle(),
            ),
          ),
          FlatButton(
            child: Icon(
              _showDetail ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: VLEPTheme.decColor,
            ),
            onPressed: (){
              setState(() {
                _showDetail = !_showDetail;
              });
            },
          )
        ],
      ),
    );
  }

  Widget _buildInfoWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 44),
            height: 40,
            alignment: Alignment.centerLeft,
            child: Text(
              'VIN：CQHY5642102768120',
              style: _bodyStyle()
            ),
          ),
          _buildLine(),
          Container(
            padding: EdgeInsets.only(left: 44),
            height: 40,
            alignment: Alignment.centerLeft,
            child: Text(
              '底盘号：02768120',
              style: _bodyStyle(),
            ),
          ),
          _buildLine(),
          Container(
            padding: EdgeInsets.only(left: 44, right: 10),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '车型：进口大众蔚揽380TSI畅行款',
                    style: _descStyle(),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Text(
                        '引擎号：YQHM6732176870743',
                        style: _descStyle(),
                      ),
                      Text(
                        '车色：白色',
                        style: _descStyle(),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCityInfoWidget() {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 10, bottom: 15, top: 15),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  '成都市',
                  style: TextStyle(
                    color: Color(0xFFA37DFC),
                    fontSize: VLEPTheme.fontSizeLarge,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  '武侯区1000号兰博基尼代理店',
                  style: _descStyle(),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                width: 100,
                child: Image.network(
                  'https://s3.cn-north-1.amazonaws.com.cn/anjiplus-vlep/c2a42e1d5f6c77e1bd41c61e039e083c5769311019352715243.png',
                  width: 12,
                  height: 23,
                ),
              ),
              Expanded(
                child: Text(
                  '计划发车时间：2019-04-10',
                  style: _descStyle(),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 100,
                child: Text(
                  '长沙市',
                  style: TextStyle(
                    color: Color(0xFFF9A574),
                    fontSize: VLEPTheme.fontSizeLarge,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  '湖南省长沙市芙蓉区五一大道',
                  style: _descStyle(),
                ),
              )
            ],
          ),
        ],
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
        padding: EdgeInsets.all(10),
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
            _buildTopTransNoWidget(),
            _buildLine(),
            _buildVANWidget(),
            _buildLine(),
            Visibility(
              visible: _showDetail,
              child: _buildInfoWidget(),
            ),
            _buildCityInfoWidget()
          ],
        ),
      ),
    );
  }
}

