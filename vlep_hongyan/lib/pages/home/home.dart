import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class HomePage extends StatelessWidget {

  final content = '${ShareUserManager.userEntity.userId} : ${ShareUserManager.userEntity.token} : ${ShareUserManager.userEntity.username}';

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
//            Text(content)
          ],
        ),
      ),
    );
  }
}
