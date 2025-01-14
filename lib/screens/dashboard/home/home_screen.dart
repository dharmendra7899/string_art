import 'package:flutter/material.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/utils/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: texts.home,
        centerTitle: true,
      ),
    );
  }
}
