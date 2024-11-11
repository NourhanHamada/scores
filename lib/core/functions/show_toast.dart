import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scores/core/theming/colors_manager.dart';

Future<bool?> showToast(
    {required String message, Color? color, ToastGravity? toastGravity}) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: toastGravity ?? ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: color ?? ColorsManager.greyColor,
    textColor: ColorsManager.whiteColor,
    fontSize: 14,
  );
}
