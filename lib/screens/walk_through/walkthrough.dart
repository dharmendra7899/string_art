import 'package:flutter/material.dart';
import 'package:string_art/constants/assets/constants.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/preferences/preferences.dart';
import 'package:string_art/screens/auth/login_screen.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/app_text.dart';
import 'package:string_art/utils/navigation.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> with Preferences {
  PageController pageController = PageController();
  int currentPage = 0;

  List<Map<String, String>> onBoardingData = [
    {
      'image': ConstantImage.appLogo,
      'title': texts.w1Title,
      'description': texts.w1Des,
    },
    {
      'image': ConstantImage.appLogo,
      'title': texts.w2Title,
      'description': texts.w2Des,
    },
    {
      'image': ConstantImage.appLogo,
      'title': texts.w3Title,
      'description': texts.w3Des,
    },
    {
      'image': ConstantImage.appLogo,
      'title': texts.w4Title,
      'description': texts.w4Des,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.primary,
      body: Stack(
        children: [
          PageView.builder(
            itemCount: onBoardingData.length,
            scrollDirection: Axis.horizontal,
            controller: pageController,
            onPageChanged: onChanged,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  appText(
                    title: onBoardingData[index]['title']!,
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    color: appColors.appWhite,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset(
                        onBoardingData[index]['image']!,
                        scale: 2,
                      )),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                    child: appText(
                      title: onBoardingData[index]['description']!,
                      textAlign: TextAlign.center,
                      fontSize: 16,
                      color: appColors.appWhite,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 42,
                  height: 42,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingData.length,
                    (index) => buildIndicator(index),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (currentPage != onBoardingData.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      setWalkThrough().then((value) {
                        if (context.mounted) {
                          navigateRemoveUntil(
                              context: context, to: const LoginScreen());
                        }
                      });
                    }
                  },
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                        color: appColors.primaryDark,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: Icon(
                        currentPage != onBoardingData.length - 1
                            ? Icons.arrow_forward
                            : Icons.done,
                        color: appColors.appWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 10.0,
      height: 10.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            currentPage == index ? appColors.appWhite : appColors.primaryDark,
      ),
    );
  }
}
