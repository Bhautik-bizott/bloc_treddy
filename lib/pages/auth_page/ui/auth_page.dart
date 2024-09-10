import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bloc_traddy/pages/auth_page/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant/app_colors.dart';
import '../../../data/app_images.dart';
import '../../../utils/enum.dart';
import '../../../widget/app_text.dart';
import '../../../widget/app_text_field.dart';
import '../../../widget/custom_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final displayNameController = TextEditingController();
    final mobileNumberController = TextEditingController();
    final referralCodeController = TextEditingController();
    final bloc = BlocProvider.of<AuthBloc>(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.textBlackColor : AppColors.backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100.h),
              child: Container(
                padding: EdgeInsets.only(top: 40.h),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.commonColorBlue,
                        AppColors.commonColorGreen,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.logoTraddy,
                        height: 40.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(21.r),
                    child: Container(
                      height: 48.h,
                      decoration: BoxDecoration(color: AdaptiveTheme.of(context).mode.isDark ? AppColors.white.withOpacity(0.20) : AppColors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: TabBar(
                          // controller: controller.tabController,
                          dividerHeight: 0.0,
                          unselectedLabelColor:
                          AdaptiveTheme.of(context).mode.isDark ? AppColors.white.withOpacity(0.60) : AppColors.textBlackColor.withOpacity(0.70),
                          labelColor: AppColors.white,
                          labelStyle: TextStyle(
                            color: AppColors.textBlackColor.withOpacity(0.70),
                            fontSize: 16.sp,
                            fontFamily: FontFamily.LATOBOLD.type,
                          ),
                          indicator: BoxDecoration(
                            color: AppColors.chipColor,
                            borderRadius: BorderRadius.circular(21.r),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          unselectedLabelStyle: TextStyle(
                            color: AppColors.textBlackColor.withOpacity(0.70),
                            fontSize: 16.sp,
                            fontFamily: FontFamily.LATOMEDIUM.type,
                          ),
                          tabs: const <Widget>[
                            Tab(
                              text: "Login",
                            ),
                            Tab(
                              text: "Signup",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customTextField(hintText: 'Enter user name', controller: userNameController, titleText: 'User Name', context: context),
                            // SizedBox(height: 10.h),
                            // customTextField(hintText: 'Enter password', controller: controller.passwordController, titleText: 'Password'),
                            SizedBox(height: 30.h),
                            customButton(
                              fontFamily: FontFamily.LATOBOLD.type,
                              color: AppColors.white,
                              onTap: () {
                                if (userNameController.text.isEmpty) {
                                  const snackBar = SnackBar(
                                      duration: Duration(seconds: 1),
                                      content:
                                      Text("Please, Enter Your Email", style: TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Medium')),
                                      backgroundColor: Colors.red);
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                }
                              },
                              fontSize: 16.sp,
                              borderRadius: 8.r,
                              height: 52.h,
                              width: MediaQuery.of(context).size.width,
                              text: 'Next',
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customTextField(titleText: 'User Name', controller: userNameController, hintText: 'Enter user name', context: context),
                                    SizedBox(height: 20.h),
                                    customTextField(titleText: 'Display Name', controller: displayNameController, hintText: 'Enter display name', context: context),
                                    SizedBox(height: 8.h),
                                    AppText(
                                      'This will be visible to all users in leaderboard',
                                      color: AdaptiveTheme.of(context).mode.isDark ? AppColors.white :AppColors.textBlackColor.withOpacity(0.80),
                                      fontSize: 12.sp,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: FontFamily.LATOMEDIUM.type,
                                    ),
                                    SizedBox(height: 20.h),
                                    customTextField(titleText: 'Mobile Number', controller: mobileNumberController, hintText: 'Enter mobile number', context: context),
                                    SizedBox(height: 20.h),
                                    customTextField(titleText: 'Referral Code', controller: referralCodeController, hintText: 'Enter your referral code', context: context),
                                    SizedBox(height: 30.h),
                                  ],
                                ),
                              ),
                            ),
                            customButton(
                              fontFamily: FontFamily.LATOBOLD.type,
                              color: AppColors.white,
                              onTap: () {
                              },
                              fontSize: 16.sp,
                              borderRadius: 8.r,
                              height: 52.h,
                              width: MediaQuery.of(context).size.width,
                              text: 'Next',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
