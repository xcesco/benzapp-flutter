import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double _devicePixelRatio;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _devicePixelRatio = _mediaQueryData.devicePixelRatio;
  }

  static dpiToPixel(int value) {
    return _devicePixelRatio * value;
  }
}
