import 'package:flutter/material.dart';

import 'pages/pages.dart';
import 'utils/config.dart';
import 'utils/theme.dart';

class VLEPApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: VLEPConfig.packageInfo.appName,
      debugShowCheckedModeBanner: false,
      theme: VLEPTheme.theme,
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage()
      },
      home: VLEPConfig.isLogined ? HomePage() : LoginPage()
    );
  }
}
