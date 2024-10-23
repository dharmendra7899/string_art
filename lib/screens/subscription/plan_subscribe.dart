import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:string_art/constants/assets/constants.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/app_button.dart';
import 'package:string_art/utils/app_text.dart';
import 'package:string_art/utils/custom_appbar.dart';

class PlanSubscribe extends StatefulWidget {
  const PlanSubscribe({super.key});

  @override
  State<PlanSubscribe> createState() => _PlanSubscribeState();
}

class _PlanSubscribeState extends State<PlanSubscribe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.primaryDark,
      appBar: CustomAppBar(
        title: texts.plan,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: boxShadow(),
                      color: appColors.appWhite),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 160,
                        height: 160,
                        child:
                            ClipOval(child: Image.asset(ConstantImage.appLogo)),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              appText(
                                  title: index==0?"Basic Plan":index==1?"Standard Plan":"Premium Plan",
                                  fontSize: 16,
                                  color: index==0?appColors.primaryDark:index==1?appColors.bgGreen:appColors.buttonColor,
                                  fontWeight: FontWeight.w600),


                            ],
                          ),
                          Row(crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              appText(
                                  title: index==0?"\u20B9999":index==1?"\u20B91499":"\u20B91999",
                                  fontSize: 14,
                                  color: appColors.appBlack,
                                  fontWeight: FontWeight.w600),
                              appText(
                                  title: "/year",
                                  fontSize: 12,
                                  color: appColors.borderColor,
                                  fontWeight: FontWeight.w500)
                            ],
                          ),
                          const SizedBox(height: 8,),
                          appText(
                              title: "${texts.pin}: 350",
                              fontSize: 14,
                              fontWeight: FontWeight.w500),

                          appText(
                              title: "${texts.line}: 20000",
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 90,
                            height: 30,
                            child: AppButton(
                              radius: 6,
                              onPressed: () {},
                              title: texts.start.toUpperCase(),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 12,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
