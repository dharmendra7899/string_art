import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:string_art/constants/assets/constants.dart';
import 'package:string_art/constants/messages.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/screens/auth/login_screen.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/app_button.dart';
import 'package:string_art/utils/app_text.dart';
import 'package:string_art/utils/app_text_field.dart';
import 'package:string_art/utils/navigation.dart';
import 'package:string_art/utils/show_toast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool _passwordVisible = true;
  bool _conPasswordVisible = true;
  bool isChecked = false;
  bool isLoading = false;

  final _registerFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    fullName.dispose();
    password.dispose();
    confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
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
          key: _registerFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: appText(
                  title: texts.signUp,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                titleText: texts.fullName,
                validator: (val) => null,
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
                validator: (val) => null,
                titleText: texts.emailAddress,
                controller: email,
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
              AppTextField(
                titleText: texts.password,
                validator: (val) => null,
                obscureText: _passwordVisible,
                controller: password,
                hintText: texts.password,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                ],
                iconData: IconButton(
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                  icon: Icon(
                    _passwordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: appColors.primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              AppTextField(
                titleText: texts.confirmPassword,
                validator: (val) => null,
                obscureText: _conPasswordVisible,
                controller: confirmPassword,
                hintText: texts.confirmPassword,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                ],
                iconData: IconButton(
                  onPressed: () {
                    setState(() {
                      _conPasswordVisible = !_conPasswordVisible;
                    });
                  },
                  icon: Icon(
                    _conPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: appColors.primary,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    visualDensity: VisualDensity.compact,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: texts.iAgree,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: appColors.appBlack,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          TextSpan(
                              text: texts.terms,
                              style: TextStyle(
                                color: appColors.secondary,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  /*   InAppWebView.route(
                                      context,
                                      ApiConstants.PRIVACY_POLICY,
                                      texts.privacy);*/
                                }),
                          TextSpan(
                            text: texts.and,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: appColors.appBlack,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          TextSpan(
                              text: texts.privacy,
                              style: TextStyle(
                                color: appColors.secondary,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  /* InAppWebView.route(
                                      context,
                                      ApiConstants.PRIVACY_POLICY,
                                      texts.privacy);*/
                                })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              AppButton(
                isLoading: isLoading,
                radius: 30,
                onPressed: () {
                  checkValidation();
                },
                title: texts.con.toUpperCase(),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appText(
                      title: texts.alreadyAccount,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  InkWell(
                      onTap: () {
                        navigateTo(context: context, to: const LoginScreen());
                      },
                      child: appText(
                        title: texts.signIn,
                        fontWeight: FontWeight.w600,
                        color: appColors.primary,
                        textDecoration: TextDecoration.underline,
                        fontSize: 16,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }

  void checkValidation() {
    if (fullName.text.isEmpty) {
      showToast(message: Messages.FULL_NAME_REQ, context: context);
    } else if (email.text.isEmpty) {
      showToast(message: Messages.EMAIL_REQ, context: context);
    } else if (password.text.isEmpty) {
      showToast(message: Messages.PASSWORD_REQ, context: context);
    } else if (confirmPassword.text.isEmpty) {
      showToast(message: Messages.CON_PASSWORD_REQ, context: context);
    } else if (password.text != confirmPassword.text) {
      showToast(message: Messages.CON_PASSWORD_NOT_MATCHED, context: context);
    } else if (!isChecked) {
      showToast(message: Messages.TERMS_REQ, context: context);
    } else {
      setState(() {
        isLoading = true;
      });
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          isLoading = false;
        });
        if (mounted) {
          navigateRemoveUntil(context: context, to: const LoginScreen());
        }
      });
    }
  }
}
