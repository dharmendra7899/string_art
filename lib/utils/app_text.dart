import 'package:flutter/material.dart';
import 'package:string_art/styles/app_colors.dart';

Text appText(
    {required String title,
    double fontSize = 12,
      int maxLine = 4,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    TextAlign? textAlign,
    TextDecoration? textDecoration,
    Color? decorationColor,
    TextOverflow? textOverflow}) {
  return Text(
    title,
    maxLines: maxLine,
    textAlign: textAlign,
    style: TextStyle(
      color: color ?? appColors.appBlack,
      fontSize: fontSize,
      fontFamily: 'Montserrat',
      fontWeight: fontWeight,
      overflow: textOverflow,
      decoration: textDecoration,
      decorationColor: decorationColor ?? appColors.borderColor,
    ),
  );
}

List<BoxShadow> boxShadow(
    {Color? color,
      double spreadRadius = 0.3,
      double blurRadius = 11,
      Offset offset = const Offset(1, 1)}) =>
    [
      BoxShadow(
        color: appColors.appBlack.withOpacity(0.08),
        spreadRadius: spreadRadius,
        blurRadius: blurRadius,
        offset: offset,
      )
    ];


