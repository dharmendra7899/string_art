
import 'package:flutter/material.dart';
import 'package:string_art/app_routes/app_routes.dart';
import 'package:string_art/app_routes/route_screens.dart';
import 'package:string_art/styles/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashRoute,
      routes: RouteScreen.routes,
    );
  }
}
