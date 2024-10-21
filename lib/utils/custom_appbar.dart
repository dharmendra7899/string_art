import 'package:flutter/material.dart';
import 'app_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingWidget;
  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.leadingWidget,
    this.actions,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 7,
        shadowColor: Colors.grey.withOpacity(0.15),
        leading: leadingWidget,
        centerTitle: centerTitle,
        title: appText(
            title: title ?? "",
            fontSize: 20,
            fontWeight: FontWeight.w500),
        toolbarHeight: 50,
        actions: actions ??
            [
              const SizedBox(),
            ]);
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
