import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constant/app_colors.dart';
import '../../../constant/app_images.dart';
import '../../../utils/enum.dart';
import '../../../utils/navigation_service.dart';
import '../../../widget/app_text.dart';
import '../../../widget/custom_button.dart';

class PinPage extends StatelessWidget {
  const PinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.textBlackColor : AppColors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    AppImages.lock,
                    height: 120.h,
                    width: 120.w,
                  ),
                ),
                SizedBox(height: 40.h),
                AppText(
                  'Enter PIN',
                  color: AdaptiveTheme.of(context).mode.isDark ? AppColors.white : AppColors.textBlackColor,
                  fontSize: 22.sp,
                  fontFamily: FontFamily.LATOBOLD.type,
                ),
                SizedBox(height: 40.h),
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: PinCodeTextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                      LengthLimitingTextInputFormatter(6), // Limit input length to 10 characters
                    ],
                    // controller: controller.pin,
                    cursorColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.chipColor : AppColors.pinBorderColorLight,
                    keyboardType: const TextInputType.numberWithOptions(signed: true),
                    enablePinAutofill: true,
                    cursorHeight: 20,
                    readOnly: true,
                    autoFocus: false,
                    hintCharacter: '-',
                    hintStyle: TextStyle(
                        color: AdaptiveTheme.of(context).mode.isDark ? AppColors.white.withOpacity(0.30) : AppColors.pinBorderColorLight,
                        fontSize: 18.sp,
                        fontFamily: FontFamily.LATOSEMIBOLD.type),
                    textStyle: TextStyle(
                        color: AdaptiveTheme.of(context).mode.isDark ? AppColors.chipColor : AppColors.pinBorderColorLight,
                        fontSize: 20.sp,
                        fontFamily: FontFamily.LATOBOLD.type),
                    textInputAction: TextInputAction.done,
                    pinTheme: PinTheme(
                      fieldHeight: 60.h,
                      fieldWidth: 49.h,
                      activeColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.chipColor : AppColors.pinBorderColorLight,
                      selectedColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.chipColor : AppColors.pinBorderColorLight,
                      inactiveColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.white.withOpacity(0.20) : AppColors.dividerGray,
                      activeFillColor: AppColors.transparent,
                      inactiveFillColor: AppColors.transparent,
                      fieldOuterPadding: EdgeInsets.zero,
                      borderWidth: 0.01.w,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    appContext: context,
                    length: 6,
                    animationDuration: const Duration(milliseconds: 0),
                    animationType: AnimationType.none,
                    onChanged: (value) {
                      // controller.pinController?.text =value;
                    },
                  ),
                ),
                SizedBox(height: 50.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomKey(
                        text: '1',
                        onPressed: () {
                          // controller.onKeyPressed(value: '1');
                        }),
                    SizedBox(width: 15.w),
                    CustomKey(
                        text: '2',
                        onPressed: () {
                          // controller.onKeyPressed(value: '2');
                        }),
                    SizedBox(width: 15.w),
                    CustomKey(
                        text: '3',
                        onPressed: () {
                          // controller.onKeyPressed(value: '3');
                        }),
                  ],
                ),
                SizedBox(height: 15.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomKey(
                        text: '4',
                        onPressed: () {
                          // controller.onKeyPressed(value: '4');
                        }),
                    SizedBox(width: 15.w),
                    CustomKey(
                        text: '5',
                        onPressed: () {
                          // controller.onKeyPressed(value: '5');
                        }),
                    SizedBox(width: 15.w),
                    CustomKey(
                        text: '6',
                        onPressed: () {
                          // controller.onKeyPressed(value: '6');
                        }),
                  ],
                ),
                SizedBox(height: 15.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomKey(
                        text: '7',
                        onPressed: () {
                          // controller.onKeyPressed(value: '7');
                        }),
                    SizedBox(width: 15.w),
                    CustomKey(
                        text: '8',
                        onPressed: () {
                          // controller.onKeyPressed(value: '8');
                        }),
                    SizedBox(width: 15.w),
                    CustomKey(
                        text: '9',
                        onPressed: () {
                          // controller.onKeyPressed(value: '9');
                        }),
                  ],
                ),
                SizedBox(height: 15.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomKey(
                        text: '•',
                        onPressed: () {
                          // controller.onKeyPressed(value: '.');
                        }), // Placeholder
                    SizedBox(width: 15.w),
                    CustomKey(
                        text: '0',
                        onPressed: () {
                          // controller.onKeyPressed(value: '0');
                        }),
                    SizedBox(width: 15.w),
                    CustomKey(text: '←', onPressed: (){
                      // controller.onDeletePressed;
                    }),
                  ],
                ),
                SizedBox(height: 30.h),
                customButton(
                  fontFamily: FontFamily.LATOBOLD.type,
                  color: AppColors.white,
                  onTap: () {
                    // if (controller.pin.text.isNotEmpty) {
                    //   controller.loginAPI();
                    // }
                  },
                  fontSize: 16.sp,
                  borderRadius: 8.r,
                  height: 52.h,
                  width: MediaQuery.of(context).size.width,
                  text: 'Next',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomKey extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomKey({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 56.h,
          decoration: BoxDecoration(
              color: AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppColors.white.withOpacity(0.12) : AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(12.r)),
          child: Center(
            child: AppText(
              text,
              fontSize: 22.sp,
              fontFamily: FontFamily.LATOSEMIBOLD.type,
              textAlign: TextAlign.center,
              color: AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
