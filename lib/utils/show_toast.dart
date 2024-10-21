import 'package:flutter/material.dart';
import 'package:string_art/styles/app_colors.dart';
import 'app_text.dart';

showToast(
    {required String message, bool? isSuccess, required BuildContext context}) {
  final snackBar = SnackBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    content: appText(
        title: message,
        textAlign: TextAlign.center,
        color: appColors.appWhite,
        fontWeight: FontWeight.w400,
        fontSize: 16),
    backgroundColor:
        isSuccess == true ? appColors.bgGreen : appColors.secondary,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(20),
    elevation: 2,
    duration: const Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
