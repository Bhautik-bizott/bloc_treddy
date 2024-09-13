import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../constant/app_colors.dart';

class Loading {
  Loading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 0)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..contentPadding = const EdgeInsets.all(10)
      ..loadingStyle = EasyLoadingStyle.custom
      ..lineWidth = 2
      ..radius = 10
      ..boxShadow = [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 4.0,
          spreadRadius: 1.0,
          offset: const Offset(0, 2),
        ),
      ]
      ..progressColor = AppColors.white
      ..backgroundColor = AppColors.white
      ..indicatorColor = AppColors.commonColor
      ..textColor = AppColors.white
      ..maskColor = AppColors.textBlackColor.withOpacity(0.5)
      ..maskType = EasyLoadingMaskType.custom
    // ..indicatorWidget = Lottie.asset(AppImages.loader, width: 70, height: 70)
      ..dismissOnTap = false;
  }

  static void show([String? text]) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show();
  }

  static void toast(String text) {
    EasyLoading.showToast(text);
  }

  static void dismiss() {
    EasyLoading.instance.userInteractions = true;
    EasyLoading.dismiss();
  }
}