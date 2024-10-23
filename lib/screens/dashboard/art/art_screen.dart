import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:string_art/constants/assets/constants.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/app_button.dart';
import 'package:string_art/utils/app_helper_funtions.dart';
import 'package:string_art/utils/app_text.dart';
import 'package:string_art/utils/custom_appbar.dart';
import 'package:string_art/utils/custom_switch.dart';

enum ImageType { image }

class ArtScreen extends StatefulWidget {
  const ArtScreen({super.key});

  @override
  State<ArtScreen> createState() => _ArtScreenState();
}

class _ArtScreenState extends State<ArtScreen> {
  File? _imageFile;
  String? storeImage;
  bool isSettingActive = false;
  double pinValue = 156;
  double lineValue = 1305;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: texts.art,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: appColors.gradient1)),
                child: _imageFile != null
                    ? GestureDetector(
                        onTap: () => uploadImage(context, ImageType.image),
                        child: ClipOval(
                          child: Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => uploadImage(context, ImageType.image),
                        child: ClipOval(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ConstantImage.upload,
                                color: appColors.borderColor,
                                scale: 1.2,
                              ),
                              appText(
                                  title: texts.upload,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: appColors.borderColor)
                            ],
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  appText(
                      title: texts.setting,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  const SizedBox(
                    width: 12,
                  ),
                  CustomSwitch(
                    height: 24,
                    width: 45,
                    value: !isSettingActive,
                    onChanged: (bool val) =>
                        setState(() => isSettingActive = !val),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              isSettingActive ? pinWidget() : const SizedBox(),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                radius: 30,
                onPressed: () {},
                title: texts.start.toUpperCase(),
                fontWeight: FontWeight.w600,
                fontSize: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pinWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: appColors.appWhite,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: appColors.primaryDark),
          boxShadow: boxShadow()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText(title: texts.pin, fontWeight: FontWeight.w600, fontSize: 14),
          const SizedBox(
            height: 6,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: appColors.borderColor.withOpacity(0.37),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.62,
                  child: Slider(
                    activeColor: appColors.primary,
                    inactiveColor: appColors.appWhite,
                    thumbColor: appColors.primaryDark,
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    min: 100.0,
                    max: 300.0,
                    value: pinValue,
                    onChanged: (value) {
                      setState(() {
                        pinValue = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: 65,
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                  ),
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: appColors.primaryDark,
                      borderRadius: BorderRadius.circular(12)),
                  child: appText(
                      title: pinValue.toInt().toString(),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: appColors.appWhite),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          appText(title: texts.line, fontWeight: FontWeight.w600, fontSize: 14),
          const SizedBox(
            height: 6,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: appColors.borderColor.withOpacity(0.37),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.62,
                  child: Slider(
                    activeColor: appColors.primary,
                    inactiveColor: appColors.appWhite,
                    thumbColor: appColors.primaryDark,
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    min: 1000.0,
                    max: 15000.0,
                    value: lineValue,
                    onChanged: (value) {
                      setState(() {
                        lineValue = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: 65,
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                  ),
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: appColors.primaryDark,
                      borderRadius: BorderRadius.circular(12)),
                  child: appText(
                      title: lineValue.toInt().toString(),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: appColors.appWhite),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void uploadImage(BuildContext context, ImageType imageType) {
    Future<void> Function({required ImageSource src}) imagePickerFunction;
    switch (imageType) {
      case ImageType.image:
        imagePickerFunction = getImage;
        break;
    }

    AppHelperFunction.chooseImages(
      context: context,
      onCameraCLick: () => imagePickerFunction(src: ImageSource.camera),
      onGalleryCLick: () => imagePickerFunction(src: ImageSource.gallery),
    );
  }

  Future<void> getImage({required ImageSource src}) async {
    final value =
        await AppHelperFunction().pickImage(img: src, context: context);
    if (value != null) {
      setState(() {
        _imageFile = value;
      });
    } else {
      log("Exception on uploading file");
    }
  }
}
