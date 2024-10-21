import 'package:flutter/material.dart';
import 'package:string_art/styles/app_colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isLoading;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool? isDisabled;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? widget;
  final double? radius;

  const AppButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.color,
      this.textColor,
      this.borderColor,
      this.fontSize = 16,
      this.widget,
      this.fontWeight = FontWeight.bold,
      this.isDisabled = false,
      this.isLoading = false,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: InkWell(onTap: isLoading == true || isDisabled == true ? null : onPressed,
        child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: isDisabled == true
                ? BoxDecoration(
                    border: borderColor != null
                        ? Border.all(color: borderColor!)
                        : null,
                    borderRadius: BorderRadius.circular(radius ?? 10),
                    color: appColors.borderColor)
                : BoxDecoration(
                    border: borderColor != null
                        ? Border.all(color: borderColor!)
                        : null,
                    borderRadius: BorderRadius.circular(radius ?? 10),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        appColors.gradient1,
                        appColors.gradient2,
                        appColors.gradient3,
                      ],
                    ),
                  ),
            child: Center(
                child: isLoading == true
                    ? CircularProgressIndicator(
                        color: appColors.appWhite,
                      )
                    : title.isNotEmpty
                        ? Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: fontSize,
                                color: isDisabled == true
                                    ? appColors.borderColor
                                    : textColor ?? appColors.appWhite,
                                fontWeight: fontWeight),
                          )
                        : widget)),
      ),
    );
  }
}
