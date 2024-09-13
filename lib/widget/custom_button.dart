import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_colors.dart';
import '../constant/app_images.dart';
import 'app_text.dart';

customButton(
    {required onTap, required width, required height, required borderRadius, required text, required fontSize, required fontFamily, required color}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: [
            AppColors.commonColorBlue,
            AppColors.commonColorGreen,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: AppText(
          text,
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily,
        ),
      ),
    ),
  );
}

customButtonForBottomSheet(
    {required onTap, required width, required height, required borderRadius, required text, required fontSize, required fontFamily, required color}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.commonColorBlue, AppColors.commonColorGreen], begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text,
              color: color,
              fontSize: fontSize,
              fontFamily: fontFamily,
            ),
            Image.asset(
              AppImages.buttonNext,
              height: 15.h,
              width: 15.w,
            )
          ],
        ),
      ),
    ),
  );
}
