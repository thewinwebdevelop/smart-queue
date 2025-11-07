import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smart_queue/configs/color.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = ColorsConfig.primaryColor
    ..indicatorColor = ColorsConfig.primaryColor
    ..textColor = ColorsConfig.mainTextColor
    ..userInteractions = true
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = false;
}
