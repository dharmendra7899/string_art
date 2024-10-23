import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:string_art/constants/messages.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/cutom_bottom_sheet.dart';
import 'package:string_art/utils/show_toast.dart';

import 'app_text.dart';

class AppHelperFunction {
  bool shouldLogout = true;

  void setShouldLogout(bool val) {
    shouldLogout = val;
  }

  static String toTitleCase(String text) {
    if (text.isEmpty) return text;
    return text
        .split(' ')
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
            : '')
        .join(' ');
  }

  DateTime selectedDateTime = DateTime.now();

  void pickDate(
      {DateTime? firstDay,
      DateTime? lastDate,
      DateTime? dateForEditProfile,
      DateTime? selectedDateAndTime,
      required DateTime focusDate,
      required Function onDateSelected}) {
    selectedDateTime = selectedDateAndTime ?? DateTime.now();
    CalendarDatePicker(
      initialDate: dateForEditProfile ?? firstDay ?? DateTime.now(),
      firstDate: firstDay ?? DateTime.now(),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 18 * 365)),
      onDateChanged: (DateTime value) {
        selectedDateTime = value;
      },
    );
  }

  Future<File?> pickImage({
    required BuildContext context,
    required ImageSource img,
    bool allowMultiple = false,
    List<String> allowedExtensions = const [
      'pdf',
      'jpg',
      'png',
    ],
  }) async {
    setShouldLogout(false);
    if (img == ImageSource.gallery) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: allowMultiple,
        allowedExtensions: allowedExtensions,
      );
      if (result != null) {
        File file = File(result.files.single.path!);
        int fileSizeInBytes = file.lengthSync();
        double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
        if (fileSizeInMB > 5 && context.mounted) {
          showToast(
              message: "File size must be less than 5MB", context: context);
        } else {
          Future.delayed(const Duration(seconds: 5))
              .then((value) => setShouldLogout(true));
          return File(result.files.single.path!);
        }
      } else {
        Future.delayed(const Duration(seconds: 5))
            .then((value) => setShouldLogout(true));
        return null;
      }
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: img, imageQuality: 50, requestFullMetadata: true);
    if (pickedFile != null) {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => setShouldLogout(true));
      return File(
        pickedFile.path,
      );
    } else {
      if (context.mounted) {
        showToast(message: "Nothing is selected", context: context);
      }
    }
    Future.delayed(const Duration(seconds: 3))
        .then((value) => setShouldLogout(true));
    return null;
  }

 static void chooseImages({
    required BuildContext context,
    required Function onCameraCLick,
    required Function onGalleryCLick,
  }) {
    return CustomBottomSheet().uploadStoreImage(
        context,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                onGalleryCLick();
                Navigator.pop(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo,
                    size: 30,
                    color: appColors.primaryDark,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  appText(
                      title: 'Gallery',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                onCameraCLick();
                Navigator.pop(context);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    size: 30,
                    color: appColors.primaryDark,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  appText(
                      title: 'Camera',
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ),
          ],
        ));
  }

 static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return Messages.PASSWORD_REQ;
    }
    final passwordPattern =
        RegExp(r'^(?=.*[A-Z])(?=.*[\W_])(?=.*\d)[A-Za-z\d\W_]{8,}$');
    if (!passwordPattern.hasMatch(value)) {
      return Messages.SPECIAL_CHARACTER;
    }
    return null;
  }

 static String? validateEmail(String? value) {
    final emailRegExp = RegExp(
      r'^([a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,})$',
      caseSensitive: false,
    );

    if (value == null || value.isEmpty) {
      return Messages.EMAIL_REQ;
    } else if (!emailRegExp.hasMatch(value)) {
      return Messages.EMAIL_VALID;
    }
    return null;
  }

  static String? validateMobileNumber(String? value) {
    final mobileRegExp = RegExp(
      r'^[7-9]\d{9}$',
    );
    if (value == null || value.isEmpty) {
      return 'Mobile number cannot be empty';
    } else if (!mobileRegExp.hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }
}
