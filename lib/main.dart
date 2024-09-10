import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:bloc_traddy/data/app_colors.dart';
import 'package:bloc_traddy/pages/auth_page/bloc/auth_bloc.dart';
import 'package:bloc_traddy/pages/auth_page/ui/auth_page.dart';
import 'package:bloc_traddy/pages/bottom_bar/bloc/bottom_bar_bloc.dart';
import 'package:bloc_traddy/pages/bottom_bar/ui/bottom_bar_page.dart';
import 'package:bloc_traddy/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeService();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // Loading();
  runApp(BlocProvider(
    create: (context) => AuthBloc(),
    child: ScreenUtilInit(
      designSize: const Size(375, 812),
      ensureScreenSize: true,
      builder: (_, child) {
        return AdaptiveTheme(
          light: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            primaryColor: AppColors.backgroundColor,
          ),
          dark: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            primaryColor: AppColors.textBlackColor,
          ),
          initial: savedThemeMode ?? AdaptiveThemeMode.light,
          builder: (theme, darkTheme) =>
              MaterialApp(
                title: 'Flutter Demo',
                debugShowCheckedModeBanner: false,
                navigatorKey: NavigationService.navigatorKey,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: AuthPage(),
              ),
        );
      },
    ),
  ));
}

