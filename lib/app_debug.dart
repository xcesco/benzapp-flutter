import 'package:flutter/foundation.dart';

abstract class AppDebug {
  static void log(String msg) {
    if (kDebugMode) {
      print(msg);
    }
  }
}
