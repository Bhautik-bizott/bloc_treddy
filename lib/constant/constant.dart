import 'package:bloc_traddy/utils/common_model.dart';
import 'package:bloc_traddy/utils/enum.dart';
import 'package:bloc_traddy/utils/secure_shared_preference.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

StorageClass storage = StorageClass();

EventBus eventBus = EventBus();

flutterSnakeBar(vMessage, {required BuildContext context, color = const Color(0xffD42424), gravity = ToastGravity.BOTTOM}) async {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 1),
    content: Text(vMessage.toString(), style: const TextStyle(color: Colors.white, fontSize: 15, fontFamily: 'Medium')),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

flutterToast(vMassage, {color = Colors.red, gravity = ToastGravity.BOTTOM, toastLength = Toast.LENGTH_LONG}) async {
  Fluttertoast.showToast(
    msg: vMassage ?? '',
    toastLength: toastLength,
    gravity: gravity,
    timeInSecForIosWeb: 3,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 15.0,
  );
}

String toFixed(double value, [int decimalPlace = 2]) {
  try {
    String originalNumber = value.toString();
    List<String> formattedNumber = originalNumber.split('.');
    return "${formattedNumber[0]}.${formattedNumber[1].substring(0, decimalPlace)}";
  } catch (_) {
  }
  return value.toString();
}

String formatAmount(value, {flag = 1}) {
  dynamic amountStr = value.toStringAsFixed(2);
  double amount = double.parse(amountStr);
  NumberFormat numberFormat = NumberFormat.decimalPattern('hi');
  return flag == 1 ? '₹ ${numberFormat.format(amount)}' : numberFormat.format(amount);
}

String formatPrice({price, flag = 1}) {
  if (price != null) {
    if (price.contains('.')) {
      List<String> parts = price.split('.');
      if (parts[1] == "0" || parts[1] == "00") {
        return flag == 0 ? "₹ ${parts[0]}" : parts[0];
      } else {
        return flag == 0 ? "₹ ${double.parse(price).toStringAsFixed(2)}" : double.parse(price).toStringAsFixed(2);
      }
    } else {
      return flag == 0 ? "₹ $price" : price;
    }
  } else {
    return "0";
  }
}

decodeJwtToken() async {
  var token = await storage.readString(key: Storage.TOKEN.type);
  Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
  JwtModel jwtModel = JwtModel.fromJson(decodedToken);
  return jwtModel;
}

String twoDecimalWithOutChange(String value) {
  double? parsedValue = double.tryParse(value);
  if (parsedValue == null) {
    return value;
  }
  String fullPrecision = parsedValue.toStringAsFixed(10);
  int decimalIndex = fullPrecision.indexOf('.');

  if (decimalIndex != -1 && fullPrecision.length > decimalIndex + 3) {
    int thirdDecimal = int.parse(fullPrecision[decimalIndex + 3]);
    if (thirdDecimal > 5) {
      return value.substring(0, decimalIndex + 3);
    }
  }
  return parsedValue.toStringAsFixed(2);
}

percentageChange({ltp, open, close}) {
  return "${double.parse(ltp.toString()) > double.parse(open.toString()) ? "+" : double.parse(ltp.toString()) < double.parse(open.toString()) ? "-" : ""}${twoDecimalWithOutChange("${double.parse(toFixed(((double.parse(close.toString()) - double.parse(ltp.toString())).abs()) * 100)) / double.parse(close.toString())}")}%";
}

/// date format

String convertDateToDDMM(String currentDate) {
  final inputFormat = DateFormat('yyyy-MM-dd');
  final DateTime date = inputFormat.parse(currentDate);

  final outputFormat = DateFormat('dd MMM');
  return outputFormat.format(date);
}

String convertDateToDDMMMYYYY(String currentDate) {
  final inputFormat = DateFormat('yyyy-MM-dd');
  final DateTime date = inputFormat.parse(currentDate);

  final outputFormat = DateFormat('dd MMM yyyy');
  return outputFormat.format(date);
}
