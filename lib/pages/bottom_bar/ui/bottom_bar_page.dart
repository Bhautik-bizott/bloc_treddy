import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bloc_traddy/pages/archived_page/ui/archived_page.dart';
import 'package:bloc_traddy/pages/leaderboard_page/leaderboard_page.dart';
import 'package:bloc_traddy/pages/market_page/ui/market_page.dart';
import 'package:bloc_traddy/pages/position_page/position_page.dart';
import 'package:bloc_traddy/pages/trades_page/trades_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant/app_colors.dart';
import '../../../constant/app_images.dart';
import '../../../utils/enum.dart';
import '../../../utils/navigation_service.dart';
import '../../../widget/bottomBarWidget.dart';
import '../bloc/bottom_bar_bloc.dart';

List<TabItem> bottomNavItems = [
  TabItem(
    AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppImages.bottomDarkTrades : AppImages.bottomTrades,
    "Trades",
    AppColors.commonColor,
    labelStyle:
        TextStyle(fontFamily: FontFamily.LATOSEMIBOLD.type, fontSize: 11.sp, color: AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppColors.white : AppColors.black),
  ),
  TabItem(
    AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppImages.bottomDarkPositions : AppImages.bottomPositions,
    "Positions",
    AppColors.commonColor,
    labelStyle:
        TextStyle(fontFamily: FontFamily.LATOSEMIBOLD.type, fontSize: 11.sp, color: AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppColors.white : AppColors.black),
  ),
  TabItem(
    AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppImages.bottomDarkMarket : AppImages.bottomMarket,
    "Market",
    AppColors.commonColor,
    labelStyle:
        TextStyle(fontFamily: FontFamily.LATOSEMIBOLD.type, fontSize: 11.sp, color: AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppColors.white : AppColors.black),
  ),
  TabItem(
    AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppImages.bottomDarkLeaderBoard : AppImages.bottomLeaderBoard,
    "LeaderBoard",
    AppColors.commonColor,
    labelStyle:
        TextStyle(fontFamily: FontFamily.LATOSEMIBOLD.type, fontSize: 11.sp, color: AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppColors.white : AppColors.black),
  ),
  TabItem(
    AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppImages.bottomDarkArchived : AppImages.bottomArchived,
    "Archived",
    AppColors.commonColor,
    labelStyle:
        TextStyle(fontFamily: FontFamily.LATOSEMIBOLD.type, fontSize: 11.sp, color: AdaptiveTheme.of(NavigationService.navigatorKey.currentContext!).mode.isDark ? AppColors.white : AppColors.black),
  ),
];

const List bottomNavScreen = [
  TradesPage(),
  PositionPage(),
  MarketPage(),
  LeaderboardPage(),
  ArchivedPage(),
];

var selectedPos = 2;

 CircularBottomNavigationController navigationController = CircularBottomNavigationController(selectedPos);

class BottomBarPage extends StatelessWidget {
  const BottomBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LandingPageBloc>(context);
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: bottomNavScreen[state.tabIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              child: CircularBottomNavigation(
                bottomNavItems,
                controller: navigationController,
                selectedPos: state.tabIndex,
                barHeight: 84.h,
                barBackgroundColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.textBlackColor : AppColors.white,
                circleStrokeWidth: 0.0,
                normalIconColor: AdaptiveTheme.of(context).mode.isDark ? AppColors.white : AppColors.black,
                iconsSize: 22,
                circleSize: 55,
                backgroundBoxShadow: <BoxShadow>[
                  BoxShadow(color: AppColors.textBlackColor.withOpacity(0.20), blurRadius: 10.0),
                ],
                animationDuration: const Duration(milliseconds: 300),
                selectedCallback: (index) {
                  selectedPos = index ?? 2;
                  BlocProvider.of<LandingPageBloc>(context).add(TabChange(tabIndex: selectedPos));
                },
              ),
            ));
      },
    );
  }
}
