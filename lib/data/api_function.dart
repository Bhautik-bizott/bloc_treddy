import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../constant/app_colors.dart';
import '../constant/constant.dart';
import '../utils/enum.dart';
import '../widget/app_text.dart';
import 'api_class.dart';

var isNetwork = false;

class APIFunction {
  apiCall({
    required String apiName,
    required context,
    FormData? params,
    Object? withOutFormData,
    APIMethods? method,
    bool isLoading = true,
  }) async {
    var token;
    token = await storage.readString(key: Storage.TOKEN.type) ?? "";
    log("tokentokentokentoken");
    log(token);
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.last == ConnectivityResult.none) {
      isNetwork = true;
      var snackBar = SnackBar(
        content: AppText('Network is unreachable', fontFamily: FontFamily.BOLD.type, fontSize: 13, color: AppColors.white, height: 0.0),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      if (isNetwork) {
        isNetwork = false;
      }
    }

    if (!isNetwork) {
      dynamic response;
      if (method == APIMethods.POST) {
        response = await HttpUtil(token, isLoading, context).post(
          apiName,
          data: params,
          context: context,
          withOutFormData: withOutFormData,
        );
      } else if (method == APIMethods.GET) {
        response = await HttpUtil(token, isLoading, context).get(apiName, context: context);
      }
      return response;
    }
  }
}
