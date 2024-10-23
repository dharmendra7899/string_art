import 'package:flutter/material.dart';
import 'package:string_art/constants/assets/constants.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/app_text.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton(
      {super.key, required this.isDisabled, required this.onPressed});

  final Function? onPressed;
  final bool? isDisabled;

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
              widget.isDisabled! ? appColors.lightColor : appColors.appWhite),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
                side: BorderSide(width: 1, color: appColors.primaryDark)),
          ),
        ),
        onPressed: () async {
          widget.onPressed!();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage(ConstantImage.google),
                height: 35,
                width: 35,
                fit: BoxFit.fill,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: appText(
                      title: texts.google,
                      fontWeight: FontWeight.w600,
                      color: widget.isDisabled!
                          ? appColors.borderColor
                          : appColors.appBlack,
                      fontSize: 16,
                      decorationColor: appColors.appBlack))
            ],
          ),
        ),
      ),
    );
  }
}

class AppleSignInButton extends StatefulWidget {
  const AppleSignInButton(
      {super.key, required this.isDisabled, required this.onPressed});

  final bool? isDisabled;
  final Function? onPressed;

  @override
  State<AppleSignInButton> createState() => _AppleSignInButtonState();
}

class _AppleSignInButtonState extends State<AppleSignInButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all( widget.isDisabled! ? appColors.lightColor : appColors.appWhite),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        onPressed: () async {
          widget.onPressed!();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               const Image(
                image: AssetImage(ConstantImage.apple),
                height: 35,
                width: 65,
                 fit: BoxFit.fill,
              ),
              appText(
                  title: texts.apple,
                  fontWeight: FontWeight.w600,
                  color: widget.isDisabled!
                      ? appColors.borderColor
                      : appColors.appBlack,
                  fontSize: 16,
                  decorationColor: appColors.appBlack)
            ],
          ),
        ),
      ),
    );
  }
}
