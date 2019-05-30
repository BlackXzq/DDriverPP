import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../services/services.dart';
import 'dart:convert' show json;

class HomePage extends StatelessWidget {

//  final content = '${ShareUserManager.userEntity.userId} : ${ShareUserManager.userEntity.token} : ${ShareUserManager.userEntity.username}';
  final content = "kekkekekek";

  void _getSchedulsList() {
    SchedulsRequest.getScheduls(
      pageNo: '1',
      driverStatus: '1',
      onSucceed: (lists) {
        print('---------------------------');
        lists.forEach((entity) {
          print(entity.carTotalNumber);
        });
        print('---------------------------');
      },
      onFailed: (notice) {
        VLEPToast.showToast(msg: notice.message);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('功能'),
        actions: <Widget>[
          FlatButton(
            child: Text('退出登录', style: TextStyle(color: Colors.white),),
            onPressed: (){
              Logout(context);
            },
          )
        ],
      ),
      body: _Body()
    );
  }
}

class _Body extends StatefulWidget {
  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {

  void _tapItem(String title) {
    LogInfo(title);
    var routName = '';
    switch (title) {
      case '我的任务':
        routName = '/task';
        break;
      case '接车扫描':
        routName = '/scan';
        break;
      case '异常登记':
        routName = '/abnormal';
        break;
      case '质损登记':
        routName = '/mass';
        break;
      case '油票管理':
        routName = '/oil';
        break;
      default:
        routName = '';
    }
    if (routName.isNotEmpty) {
      Navigator.of(context).pushNamed(routName);
    }
  }

  Widget _buildItem(String title, String imgUrl) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap:() => _tapItem(title),
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: VLEPTheme.primaryColor,
                    shape: BoxShape.circle
                  ),
                ),
                Image.network(
                  imgUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.fill,
                )
              ],
            )
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              title,
              style: TextStyle(
                  color: VLEPTheme.bodyColor,
                  fontSize: VLEPTheme.fontSizeNormal
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget _buildMyTaskItem() {
    return GestureDetector(
      onTap:() => _tapItem('我的任务'),
      child: Column(
        children: <Widget>[
          Container(height: 80),
          Stack(
            alignment: Alignment(0, 0),
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: VLEPTheme.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                height: 100,
                width: 250,
              ),
              Image.network(
                'https://s3.cn-north-1.amazonaws.com.cn/anjiplus-vlep/985b5cd9741c63d881eb61b2cc37b7331896438121677722005.png',
                width: 48,
                height: 52,
                fit: BoxFit.fill,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              '我的任务',
              style: TextStyle(
                color: VLEPTheme.bodyColor,
                fontSize: VLEPTheme.fontSizeNormal,
              ),
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: <Widget>[
            _buildMyTaskItem(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildItem(
                  '接车扫描',
                  'https://s3.cn-north-1.amazonaws.com.cn/anjiplus-vlep/d710241d13d872af4371a80fb7e838968970605603745428239.png',
                ),
                _buildItem(
                  '质损登记',
                  'https://s3.cn-north-1.amazonaws.com.cn/anjiplus-vlep/fae8822232301bcc43d65763a71ed8af1978143723713394200.png',
                )
              ],
            ),
            Container(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildItem(
                  '异常登记',
                  'https://s3.cn-north-1.amazonaws.com.cn/anjiplus-vlep/2f6942b6b5ac4b47c1184916f7901ccf8767386284559932470.png',
                ),
                _buildItem(
                  '油票管理',
                  'https://s3.cn-north-1.amazonaws.com.cn/anjiplus-vlep/6ae32b160351a977b4284a6f99f91b7d371233642021143038.png',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

