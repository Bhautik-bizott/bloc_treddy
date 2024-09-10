import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/app_colors.dart';
import '../utils/enum.dart';
import 'app_text.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final bool? readOnly;
  final Color? fieldColor;
  final Color? borderColor;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? errorBorder;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? fontFamily;

  const AppTextField(
      {super.key,
      this.hintText,
      this.suffixIcon,
      this.readOnly,
      this.controller,
      this.keyboardType,
      this.inputFormatters,
      this.fieldColor = const Color(0xffffffff),
      this.borderColor = Colors.transparent,
      this.onChanged,
      this.onTap,
      this.fontFamily = "latoBold",
      this.errorBorder = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.h,
      width: double.infinity,
      child: Material(
        color: AppColors.transparent,
        child: TextField(
          readOnly: readOnly ?? false,
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          onTap: onTap,
          cursorColor: AppColors.black,
          inputFormatters: inputFormatters,
          style: TextStyle(fontSize: 16.sp, color: AppColors.black, fontFamily: fontFamily),
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            filled: true,
            fillColor: fieldColor,
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorBorder! ? AppColors.transparent : borderColor!),
              borderRadius: BorderRadius.circular(10.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorBorder! ? AppColors.transparent : borderColor!),
              borderRadius: BorderRadius.circular(10.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorBorder! ? AppColors.transparent : borderColor!),
              borderRadius: BorderRadius.circular(10.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: errorBorder! ? AppColors.transparent : borderColor!),
              borderRadius: BorderRadius.circular(10.r),
            ),
            contentPadding: EdgeInsets.only(left: 20.w),
            hintStyle: TextStyle(fontSize: 16.sp, color: AppColors.black.withOpacity(0.50), fontFamily: fontFamily),
          ),
        ),
      ),
    );
  }
}

customTextField({titleText, controller, hintText, context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppText(
        titleText,
        color: AdaptiveTheme.of(context).mode.isDark ? AppColors.white.withOpacity(0.60) : AppColors.textBlackColor.withOpacity(0.60),
        fontSize: 14.sp,
        fontFamily: FontFamily.LATOMEDIUM.type,
      ),
      SizedBox(height: 10.h),
      SizedBox(
        height: 52.h,
        child: TextFormField(
          controller: controller,
          cursorColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.white :AppColors.textBlackColor,
          style: TextStyle(
            color: AdaptiveTheme.of(context).mode.isDark ? AppColors.white : AppColors.textBlackColor,
            fontSize: 15.sp,
            fontFamily: FontFamily.LATOBOLD.type,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              borderSide: BorderSide(color: AdaptiveTheme.of(context).mode.isDark ? AppColors.white.withOpacity(0.20) : AppColors.dividerGray),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              borderSide: BorderSide(
                  color: AdaptiveTheme.of(context).mode.isDark ? AppColors.white.withOpacity(0.20) : AppColors.textFieldErrorBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              borderSide: BorderSide(color: AdaptiveTheme.of(context).mode.isDark ? AppColors.white.withOpacity(0.20) : AppColors.dividerGray),
            ),
            contentPadding: EdgeInsets.only(left: 18.w, right: 18.w),
            filled: true,
            fillColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.transparent : AppColors.white,
            focusColor: AppColors.white,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AdaptiveTheme.of(context).mode.isDark ? AppColors.white.withOpacity(0.30) : AppColors.textBlackColor.withOpacity(0.30),
              fontSize: 15.sp,
              fontFamily: FontFamily.LATOREGULAR.type,
            ),
          ),
        ),
      ),
    ],
  );
}
