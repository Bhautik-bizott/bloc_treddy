import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bloc_traddy/widget/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant/app_colors.dart';

class ArchivedPage extends StatelessWidget {
  const ArchivedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.textBlackColor : AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: Container(
          padding: EdgeInsets.only(top: 15.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.r), bottomRight: Radius.circular(16.r)),
            gradient: LinearGradient(
              colors: [
                AppColors.commonColorBlue,
                AppColors.commonColorGreen,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
              child: CommonAppBar(
                onProfileNavigationComplete: () {
                },
                onTapDown: () {
                  // showGeneralDialog(
                  //   context: context,
                  //   barrierDismissible: true,
                  //   transitionDuration: const Duration(milliseconds: 500),
                  //   barrierLabel: MaterialLocalizations.of(context).dialogLabel,
                  //   barrierColor: Colors.black.withOpacity(0.5),
                  //   pageBuilder: (context, _, __) {
                  //     return SafeArea(
                  //       child: Column(
                  //         children: [buildContainer(controller, context)],
                  //       ),
                  //     );
                  //   },
                  //   transitionBuilder: (context, animation, secondaryAnimation, child) {
                  //     return SlideTransition(
                  //       position: CurvedAnimation(
                  //         parent: animation,
                  //         curve: Curves.easeOut,
                  //       ).drive(Tween<Offset>(
                  //         begin: const Offset(0, -1.0),
                  //         end: Offset.zero,
                  //       )),
                  //       child: child,
                  //     );
                  //   },
                  // );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  // child: TabBar(
                  //   // controller: controller.tabController,
                  //   dividerHeight: 0.0,
                  //   unselectedLabelColor: AppColors.white,
                  //   labelColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.white : AppColors.commonColor,
                  //   labelStyle: TextStyle(
                  //     color: AppColors.white,
                  //     fontSize: 16.sp,
                  //     fontFamily: FontFamily.LATOBOLD.type,
                  //   ),
                  //   indicator: BoxDecoration(
                  //     color: AdaptiveTheme.of(context).mode.isDark ? AppColors.textBlackColor : AppColors.white,
                  //     borderRadius: BorderRadius.circular(20.r),
                  //   ),
                  //   indicatorSize: TabBarIndicatorSize.tab,
                  //   unselectedLabelStyle: TextStyle(
                  //     color: AppColors.white,
                  //     fontSize: 16.sp,
                  //     fontFamily: FontFamily.LATOBOLD.type,
                  //   ),
                  //   onTap: (index) async {
                  //     // if (index == 0) {
                  //     //   controller.selectedSegment = "NSE";
                  //     //   await storage.writeString(key: Storage.SEGMENT.type, value: AppStrings.NSE);
                  //     // } else if (index == 1) {
                  //     //   controller.selectedSegment = "MCX";
                  //     //   await storage.writeString(key: Storage.SEGMENT.type, value: AppStrings.MCX);
                  //     // }
                  //     // controller.getArchivedDataApi(sortByDate: null, sortByRank: null, sortByWinOrLoss: null);
                  //   },
                  //   tabs: const <Widget>[
                  //     Tab(
                  //       text: "NSE",
                  //     ),
                  //     Tab(
                  //       text: "MCX",
                  //     ),
                  //   ],
                  // ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
            "Archived Page"
        ),
      ),
    );
  }
}
