import 'package:flutter/material.dart';
import 'package:string_art/styles/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.value, required this.onChanged});

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
        width: 55.0,
        height: 30.0,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1.5,
              color: widget.value ? appColors.appBlack : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(24.0),
          color: widget.value ? appColors.appWhite : Colors.grey.shade100,
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
                  color: widget.value ? appColors.primary : Colors.greenAccent),
            ),
          ),
        ),
      ),
    );
  }
}
