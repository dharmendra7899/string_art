import 'package:flutter/material.dart';
import 'package:string_art/constants/assets/constants.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/preferences/preferences.dart';
import 'package:string_art/screens/auth/login_screen.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/app_text.dart';
import 'package:string_art/utils/custom_appbar.dart';
import 'package:string_art/utils/navigation.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> with Preferences {
  String getInitials(String name) {
    if (name.trim().isEmpty) {
      return '';
    }

    List<String> names = name.trim().split(RegExp(r'\s+'));
    StringBuffer initials = StringBuffer();

    for (String n in names) {
      if (n.isNotEmpty) {
        initials.write(n[0].toUpperCase());
      }
    }
    return initials.toString();
  }

  final List<Map<String, String>> tempList = [
    {"name": texts.subscription},
    {"name": texts.privacy},
    {"name": texts.termCondition},
    {"name": texts.faq},
    //  {"name": texts.deleteAccount},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: texts.account,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profileContainer(
                  name: 'Dharmendra Kumar',
                  email: 'support@gmail.com',
                ),
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: appColors.appWhite,
                    border: Border.all(width: 1, color: appColors.lightColor),
                    boxShadow: boxShadow(),
                  ),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: tempList.length,
                    separatorBuilder: (context, index) {
                      return tempList[index]['name'] == ''
                          ? const SizedBox()
                          : Divider(
                              color: appColors.borderColor,
                              height: 1,
                              thickness: 0.7,
                            );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return tempList[index]['name'] == ''
                          ? const SizedBox()
                          : InkWell(
                              onTap: () {},
                              child: SizedBox(
                                height: 50,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    appText(
                                      title: tempList[index]['name'] ?? '',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 15,
                                      color: appColors.borderColor,
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
            logoutButton(),
          ],
        ),
      ),
    );
  }

  Widget logoutButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0),
      child: InkWell(
        onTap: () {
          removeToken().then((value) {
            if (mounted) {
              navigateRemoveUntil(context: context, to: const LoginScreen());
            }
          });
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                appColors.gradient1,
                appColors.gradient2,
                appColors.gradient3,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ConstantImage.logout,
                height: 20,
                width: 20,
                color: appColors.appWhite,
              ),
              const SizedBox(
                width: 12,
              ),
              appText(
                title: texts.logout,
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileContainer({
    required String name,
    required String email,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(width: 1, color: appColors.lightColor),
        boxShadow: boxShadow(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText(
              title: texts.profile,
              fontSize: 18,
              color: appColors.appBlack,
              fontWeight: FontWeight.w500),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: appColors.borderColor),
                child: appText(
                    title: getInitials(name.toUpperCase()),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: appColors.appWhite),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText(
                        title: name, fontSize: 16, fontWeight: FontWeight.w600),
                    appText(
                        title: email,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    const SizedBox(height: 3),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          appText(
                              title: "Edit",
                              fontSize: 12,
                              color: appColors.primaryDark,
                              fontWeight: FontWeight.w500),
                          const SizedBox(width: 5),
                          Icon(Icons.arrow_forward_ios,
                              size: 12, color: appColors.primary),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
