import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'utils/utils.dart';
import 'app.dart';

void main() {
  PackageInfo.fromPlatform().then((packageInfo) {
    VLEPConfig.packageInfo = packageInfo;
    ShareUserManager();

    runApp(VLEPApp());
  });
}




