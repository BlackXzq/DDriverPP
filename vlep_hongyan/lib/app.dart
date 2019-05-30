import 'package:flutter/material.dart';

import 'pages/pages.dart';
import 'utils/utils.dart';



class VLEPApp extends StatefulWidget {
  @override
  _VLEPAppState createState() => _VLEPAppState();
}

class _VLEPAppState extends State<VLEPApp> {

  bool isLogined = false;
  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  void getUserInfo() async {
    final user = await ShareUserManager().getUserEntity();
    isLogined = user.token.isNotEmpty;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: VLEPConfig.packageInfo.appName,
      debugShowCheckedModeBanner: false,
      theme: VLEPTheme.theme,
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/task': (context) => MyTaskPage(),
        '/scan': (context) => ScanCarPage(),
        '/mass': (context) => MassLossPage(),
        '/abnormal': (context) => AbNormalPage(),
        '/oil': (context) => OilOrderListPage(),
        '/add_Oil': (context) => AddOilOrderPage(),
      },
      home: isLogined ? HomePage() : LoginPage()
    );
  }
}


