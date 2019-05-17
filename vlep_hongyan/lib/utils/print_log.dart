
import 'package:logging/logging.dart';
import 'config.dart';


const String _VLEPLogKey = 'com.anji.plus.vlep';

class VLEPLog {

  Map<String, Logger> _loggers = {};

  static VLEPLog _instance;
  VLEPLog._();

  factory VLEPLog() {
    if (_instance == null) {
      _instance = VLEPLog._();
    }
    return _instance;
  }

  Logger _getLogger(String name) {
    if (_loggers[name] == null) {
      Logger.root.level = VLEPConfig.loggerLevel;
      final logger = Logger(name);
      logger.onRecord
          .where((record) => record.loggerName == logger.name)
          .listen((record) {
        final label =
        record.loggerName.padRight(7).substring(0, 7).toUpperCase();
        final time = record.time.toIso8601String().substring(0, 23);
        final level = record.level.toString().padRight(7);
        print('$label $time $level ${record.message}');
      });
      _loggers[name] = logger;
    }
    return _loggers[name];
  }


  void logInfo(dynamic message) {
    final log = _getLogger(_VLEPLogKey);
//    log.log(VLEPConfig.loggerLevel, message);
    print(message);
  }
}