import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_text.dart';

class AppTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? iconData;
  final Widget? leadingIcon;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool readOnly;
  final Color? borderColor;
  final TextEditingController? controller;
  final Function()? onTap;
  final String? hintText;
  final Function(String val)? onChanged;
  final String? initialValue;
  final bool obscureText;
  final FocusNode? focusNode;
  final int? maxLines;
  final String? counterText;
  final double? fontSize;
  final Widget? prefixIcon;
  final TextCapitalization textCapitalization;
  final TextInputType? keyBoardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsetsGeometry contentPadding;
  final String obscuringCharacter;
  final String titleText;
  final TextAlign textAlign;
  final String? prefixText;
  final TextStyle? hintStyle;
  final Color? bgColor;
  final Color? textColor;
  final String? Function(String?)? validator;
  final String errorMessage;

  const AppTextField({
    super.key,
    this.labelText,
    this.width = 1,
    this.iconData,
    this.controller,
    this.onTap,
    this.readOnly = false,
    this.height,
    this.hintText,
    this.onChanged,
    this.hintStyle,
    this.bgColor,
    this.prefixIcon,
    this.leadingIcon,
    this.initialValue,
    this.style = const TextStyle(),
    this.fontSize = 16,
    this.obscureText = false,
    this.focusNode,
    this.errorMessage = "Invalid Value",
    this.keyBoardType = TextInputType.text,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.borderColor,
    this.validator,
    this.labelStyle,
    this.prefixText,
    this.counterText,
    this.titleText = '',
    this.obscuringCharacter = '•',
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText.isNotEmpty) ...[
          appText(
            title: titleText,
            fontSize: 14,
            maxLine: 1,
            textOverflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 4),
        ],
        SizedBox(
          height: height,
          width: w * width!,
          child: TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyBoardType,
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            textAlign: textAlign,
            onChanged: onChanged,
            readOnly: readOnly,
            textCapitalization: textCapitalization,
            maxLines: maxLines,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: onFieldSubmitted,
            initialValue: initialValue,
            onTap: onTap,
            enableSuggestions: true,
            style: style?.copyWith(
                  fontSize: fontSize,
                  color: textColor,
                  fontFamily: 'Montserrat',
                ) ??
                TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                  fontFamily: 'Montserrat',
                ),
            obscuringCharacter: obscuringCharacter,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              counterText: counterText,
              prefix: leadingIcon,
              prefixText: prefixText,
              filled: readOnly,
              hintText: hintText ?? "",
              hintStyle: hintStyle,
              suffixIcon: iconData,
              labelText: labelText,
              labelStyle: labelStyle,
              contentPadding: contentPadding,
              alignLabelWithHint: true,
              border: _getBorder(),
              focusedBorder: _getBorder(),
              enabledBorder: _getBorder(),
              disabledBorder: _getBorder(),
              // errorBorder: _getBorder(),
              focusedErrorBorder: _getBorder(),
            ),
          ),
        ),
      ],
    );
  }

  InputBorder _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: borderColor ?? Colors.grey,
      ),
    );
  }
}
