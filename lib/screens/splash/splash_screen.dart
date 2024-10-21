import 'package:flutter/material.dart';
import 'package:string_art/constants/assets/constants.dart';
import 'package:string_art/preferences/preferences.dart';
import 'package:string_art/screens/bottom_navigation/bottom_navigation.dart';
import 'package:string_art/screens/walk_through/walkthrough.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/navigation.dart';

import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with Preferences {
  _navigation() async {
    bool isGoWalkThrough = await isWalkThrough();
    String token = await getToken();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        navigateRemoveUntil(
            context: context,
            to: isGoWalkThrough
                ? const Walkthrough()
                : token.isEmpty
                    ? const LoginScreen()
                    : const BottomNavigation());
      }
    });
  }

  @override
  void initState() {
    _navigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.primary,
      body: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: Image.asset(
              ConstantImage.appLogo,
              scale: 2,
            )),
      ),
    );
  }
}
