import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:string_art/constants/messages.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/utils/app_button.dart';
import 'package:string_art/utils/app_helper_funtions.dart';
import 'package:string_art/utils/custom_appbar.dart';

import '../../constants/assets/constants.dart';
import '../../utils/app_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  bool isLoading = false;

  final _profileFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    initializeData();
  }

  initializeData() {
    fullName.text = 'Dharmendra Kumar';
    emailAddress.text = 'supprot@gmail.com';
  }

  @override
  void dispose() {
    super.dispose();
    emailAddress.dispose();
    fullName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: texts.profile,
        centerTitle: false,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            _logo(),
            _form(),
          ],
        ),
      ),
    );
  }

  Widget _logo() {
    return SizedBox(
      height: 100,
      width: 100,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Image.asset(
            ConstantImage.appLogo,
            scale: 1.7,
          )),
    );
  }

  Widget _form() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _profileFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              AppTextField(
                titleText: texts.fullName,
                validator: (val) =>
                    val == null || val.isEmpty ? Messages.FULL_NAME_REQ : null,
                controller: fullName,
                hintText: texts.fullName,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(50),
                ],
                textCapitalization: TextCapitalization.words,
                keyBoardType: TextInputType.text,
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextField(
                readOnly: true,
                validator: (val) => AppHelperFunction.validateEmail(val ?? ''),
                titleText: texts.emailAddress,
                controller: emailAddress,
                hintText: 'Enter your email',
                errorMessage: Messages.EMAIL_VALID,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(30),
                ],
                keyBoardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                isLoading: isLoading,
                radius: 30,
                onPressed: () {
                  if (_profileFormKey.currentState?.validate() ?? false) {
                    setState(() {
                      isLoading = true;
                    });
                    Future.delayed(const Duration(seconds: 1), () {
                      setState(() {
                        isLoading = false;
                      });
                      if (mounted) {
                        Navigator.pop(context);
                      }
                    });
                  }
                },
                title: texts.update.toUpperCase(),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
