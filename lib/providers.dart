import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_art/view_models/auth_provider.dart';

class Providers extends StatelessWidget {
  final Widget widget;
  const Providers({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: widget,
    );
  }
}
