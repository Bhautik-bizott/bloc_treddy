import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../constant/app_apis.dart';
import '../constant/constant.dart';
import 'loading.dart';

class HttpUtil {
  factory HttpUtil(String token, bool isLoading, BuildContext context) => _instance(
        token,
        isLoading,
        context,
      );

  static HttpUtil _instance(token, isLoading, context) => HttpUtil._internal(
        token: token,
        isLoading: isLoading,
        context: context,
      );

  late Dio dio;

  CancelToken cancelToken = CancelToken();
  String apiUrl = Apis.liveURL;

  HttpUtil._internal({String? token, bool? isLoading, required BuildContext context}) {
    BaseOptions options = BaseOptions(
      baseUrl: apiUrl,
      connectTimeout: 50000,
      receiveTimeout: 50000,
      headers: {
        'Authorization': "Bearer $token",
        "Accept": "application/json",
      },
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    dio.interceptors
        .add(LogInterceptor(request: false, requestBody: false, requestHeader: false, responseBody: false, responseHeader: false, error: false));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (isLoading!) {
          Loading.show();
        }
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        if (isLoading!) {
          Loading.dismiss();
        }
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        if (isLoading!) {
          Loading.dismiss();
        }
        onError(createErrorEntity(e), context);
        return handler.next(e); //continue
      },
    ));
  }

  void onError(ErrorEntity eInfo, BuildContext context) {}

  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return ErrorEntity(code: -1, message: "Request to server was cancelled");
      case DioErrorType.connectTimeout:
        return ErrorEntity(code: -2, message: "Connection timeout with server");
      case DioErrorType.sendTimeout:
        return ErrorEntity(code: -3, message: "Send timeout in connection with server");
      case DioErrorType.receiveTimeout:
        return ErrorEntity(code: -4, message: "Receive timeout in connection with server");
      case DioErrorType.other:
        if (error.message.contains("SocketException")) {
          return ErrorEntity(code: -5, message: "Your internet is not available, please try again later");
        } else if (error.message.contains("Software caused connection abort")) {
          return ErrorEntity(code: -6, message: "Your internet is not available, please try again later");
        }
        return ErrorEntity(code: -7, message: "Oops something went wrong");
      default:
        return ErrorEntity(code: -8, message: "Oops something went wrong");
    }
  }

  void cancelRequests() {
    cancelToken.cancel("cancelled");
  }

  /// restful get
  get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    required context,
    bool noCache = true,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= {};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "noCache": noCache,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    try {
      var response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      log(jsonEncode(response.data));
      return response.data;
    } on DioError catch (e) {
      if (kDebugMode) {
        print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      }
      if (kDebugMode) {
        print(e.response.toString());
      }
      if (kDebugMode) {
        print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      }
      log(e.response!.data.toString());
      if (e.response?.statusCode == 500) {
        flutterSnakeBar(e.response?.data['displayMessage'] ?? 'Oops! Something went wrong.', context: context, color: Colors.red);
      } else if (e.response?.statusCode == 401) {
        // showDialog(
        //   context: context,
        //   barrierDismissible: true,
        //   builder: (BuildContext context) {
        //     return alertDialogWidget();
        //   },
        // );
        Future.delayed(const Duration(seconds: 2), () {
          // removeUserToken();
          // getx.Get.offAllNamed(Routes.SIGN_IN);
        });
      } else {
        final snackBar = SnackBar(
            content: Text(e.response?.data['displayMessage'] ?? e.response?.data['rmsg'],
                style: const TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Medium')),
            backgroundColor: Colors.red);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  /// restful post
  post(
    String path, {
    FormData? data,
    Object? withOutFormData,
    required context,
    bool isSocket = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    log(jsonEncode(withOutFormData));
    log(jsonEncode(data));
    try {
      var response = await dio.post(
        path,
        data: withOutFormData ?? data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      log(jsonEncode(response.data));
      return response.data;
    } on DioError catch (e) {
      if (kDebugMode) {
        print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      }
      if (kDebugMode) {
        print(e.response.toString());
      }
      if (kDebugMode) {
        print(e.response?.statusCode.toString());
      }
      if (kDebugMode) {
        print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      }
      if (e.response?.statusCode == 500) {
        flutterToast(e.response?.data['displayMessage'] ?? 'Oops! Something went wrong.', color: Colors.red);
      } else if (e.response?.statusCode == 401) {
        // showDialog(
        //   context: context,
        //   barrierDismissible: true,
        //   builder: (BuildContext context) {
        //     return alertDialogWidget();
        //   },
        // );
        Future.delayed(const Duration(seconds: 2), () {
          // removeUserToken();
          // getx.Get.offAllNamed(Routes.SIGN_IN);
        });
      } else {
        if (e.response?.data['rdata'] != null) {
          flutterToast(e.response?.data['rdata']['displayMessage'], color: Colors.red);
        } else {
          flutterToast(e.response?.data['displayMessage'] ?? e.response?.data['rmsg'], color: Colors.red);
        }
      }
    }
  }


  /// restful put
  put(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful delete
  delete(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful patch
  patch(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post form
  postForm(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post Stream
  postStream(
    String path, {
    dynamic data,
    int dataLength = 0,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });
    var response = await dio.post(
      path,
      data: Stream.fromIterable(data.map((e) => [e])),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}
/*AlertDialog alertDialogWidget() {
  return AlertDialog(
    actionsPadding: EdgeInsets.zero,
    buttonPadding: EdgeInsets.zero,
    title: AppText(
      AppStrings.logging,
      fontSize: 18.sp,
      fontFamily: FontFamily.LATOBOLD.type,
      color: AppColors.white,
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(color: AppColors.white),
        SizedBox(height: 10.h),
        AppText(
          AppStrings.logoutDes,
          color: AppColors.white.withOpacity(0.75),
          fontFamily: FontFamily.LATOSEMIBOLD.type,
          fontSize: AppFontSize.fourteenPx,
        ),
      ],
    ),
  );
}*/
