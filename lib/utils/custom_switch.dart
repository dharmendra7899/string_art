import 'package:flutter/material.dart';
import 'package:string_art/styles/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double height;
  final double width;

  const CustomSwitch(
      {super.key,
      required this.value,
      required this.onChanged,
      this.height = 30,
      this.width = 55});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.value == false
            ? widget.onChanged(true)
            : widget.onChanged(false);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.5,
              color: widget.value ? appColors.appBlack : appColors.gradient1),
          borderRadius: BorderRadius.circular(24.0),
          color: widget.value ? appColors.appWhite : appColors.lightColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            alignment: widget.value
                ? ((Directionality.of(context) == TextDirection.rtl)
                    ? Alignment.centerRight
                    : Alignment.centerLeft)
                : ((Directionality.of(context) == TextDirection.rtl)
                    ? Alignment.centerLeft
                    : Alignment.centerRight),
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.value ? appColors.secondary : appColors.bgGreen),
            ),
          ),
        ),
      ),
    );
  }
}
