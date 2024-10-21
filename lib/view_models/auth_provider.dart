
import 'package:flutter/material.dart';
import '../preferences/preferences.dart';

class AuthProvider extends ChangeNotifier with Preferences {
  final bool _showLoader = false;
  bool get showLoader => _showLoader;



}
