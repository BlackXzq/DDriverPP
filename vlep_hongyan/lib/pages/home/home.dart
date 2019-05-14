import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../services/services.dart';

class HomePage extends StatelessWidget {

  final content = '${ShareUserManager.userEntity.userId} : ${ShareUserManager.userEntity.token} : ${ShareUserManager.userEntity.username}';


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

      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pushReplacementNamed('/login');
              },
              child: Text('退出登录'),
            ),
            RaisedButton(
              onPressed: _getSchedulsList,
              child: Text('获取信息列表'),
            ),
          ],
        ),
      ),
    );
  }
}
