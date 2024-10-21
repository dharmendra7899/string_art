import 'package:flutter/material.dart';
import 'package:string_art/constants/assets/constants.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/screens/dashboard/account/account_screen.dart';
import 'package:string_art/screens/dashboard/albums/album_screen.dart';
import 'package:string_art/screens/dashboard/art/art_screen.dart';
import 'package:string_art/screens/dashboard/home/home_screen.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/app_text.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreen(),
      const ArtScreen(),
      const AlbumScreen(),
      const AccountScreen(),
    ];
    return Scaffold(
      backgroundColor: appColors.appWhite,
      body: screens[selectedIndex],
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget bottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: boxShadow(spreadRadius: 1.8, blurRadius: 30),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        child: BottomNavigationBar(
          unselectedItemColor: appColors.primaryDark,
          selectedLabelStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          unselectedLabelStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          backgroundColor: appColors.gradient2,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                height: 20,
                width: 20,
                fit: BoxFit.fill,
                ConstantImage.home,
                color: appColors.primaryDark,
              ),
              activeIcon: Image.asset(
                height: 20,
                width: 20,
                fit: BoxFit.fill,
                ConstantImage.home,
                color: appColors.appWhite,
              ),
              label: texts.home,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                height: 22,
                width: 22,
                fit: BoxFit.fill,
                ConstantImage.art,
                color: appColors.primaryDark,
              ),
              activeIcon: Image.asset(
                height: 22,
                width: 22,
                fit: BoxFit.fill,
                ConstantImage.art,
                color: appColors.appWhite,
              ),
              label: texts.art,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                height: 20,
                width: 20,
                fit: BoxFit.fill,
                ConstantImage.album,
                color: appColors.primaryDark,
              ),
              activeIcon: Image.asset(
                height: 20,
                width: 20,
                fit: BoxFit.fill,
                ConstantImage.album,
                color: appColors.appWhite,
              ),
              label: texts.album,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                height: 20,
                width: 20,
                fit: BoxFit.fill,
                ConstantImage.account,
                color: appColors.primaryDark,
              ),
              activeIcon: Image.asset(
                height: 20,
                width: 20,
                fit: BoxFit.fill,
                ConstantImage.account,
                color: appColors.appWhite,
              ),
              label: texts.account,
            ),
          ],
          selectedFontSize: 14,
          iconSize: 20.0,
          currentIndex: selectedIndex,
          selectedItemColor: appColors.appWhite,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
