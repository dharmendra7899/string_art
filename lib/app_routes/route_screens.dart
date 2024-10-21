import 'package:flutter/material.dart';
import 'package:string_art/screens/auth/login_screen.dart';
import 'package:string_art/screens/auth/register_screen.dart';
import 'package:string_art/screens/splash/splash_screen.dart';
import 'package:string_art/screens/walk_through/walkthrough.dart';

import 'app_routes.dart';

class RouteScreen {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.splashRoute: (context) => const SplashScreen(),
    AppRoutes.walkThroughRoute: (context) => const Walkthrough(),
    AppRoutes.loginRoute: (context) => const LoginScreen(),
    AppRoutes.registerRoute: (context) => const RegisterScreen(),
  };
}
