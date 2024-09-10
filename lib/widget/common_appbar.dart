import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bloc_traddy/constant/constant.dart';
import 'package:bloc_traddy/data/app_colors.dart';
import 'package:bloc_traddy/data/app_images.dart';
import 'package:bloc_traddy/utils/enum.dart';
import 'package:bloc_traddy/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonAppBar extends StatefulWidget {
  final child;
  final onTapDown;
  final VoidCallback? onProfileNavigationComplete;

  const CommonAppBar({super.key, this.onProfileNavigationComplete, this.child, this.onTapDown});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  dynamic userName = 'X';

  @override
  void initState() {
    getUserName();
    // TODO: implement initState
    super.initState();
  }

  getUserName() async {
    userName = await storage.readString(key: Storage.NAME.type);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            AppImages.logo,
            height: 28.h,
            width: 28.w,
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: widget.onTapDown,
            child: Image.asset(
              AppImages.down_arrow,
              height: 24.h,
              width: 24.w,
            ),
          ),
          const Spacer(),
          Container(
            height: 40.h,
            width: 180.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AdaptiveTheme.of(context).mode.isDark ? AppColors.textBlackColor.withOpacity(0.30) : AppColors.white.withOpacity(0.15)),
            child: widget.child,
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              // Get.toNamed(Routes.PROFILE)?.then((value) {
                // if (onProfileNavigationComplete != null) {
                //   onProfileNavigationComplete!();
                // }
              // });
            },
            child: Container(
              height: 24.h,
              width: 24.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: AppColors.white),
              child: Center(
                child: AppText(
                  'k',
                  // userName!.isEmpty ? "" : userName.toString().substring(0, 1).toUpperCase(),
                  color: AppColors.black,
                  fontFamily: FontFamily.LATOBOLD.type,
                  fontSize: 13.sp,
                  maxLines: 1,
                  height: 0.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: () {
              // Get.toNamed(Routes.WALLET);
            },
            child: Image.asset(
              AppImages.icWallet,
              height: 24.h,
              width: 24.w,
            ),
          )
        ],
      ),
    );
  }
}
