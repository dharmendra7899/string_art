import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:string_art/constants/messages.dart';
import 'package:string_art/constants/texts.dart';
import 'package:string_art/screens/auth/register_screen.dart';
import 'package:string_art/screens/bottom_navigation/bottom_navigation.dart';
import 'package:string_art/styles/app_colors.dart';
import 'package:string_art/utils/app_button.dart';
import 'package:string_art/utils/app_text.dart';
import 'package:string_art/utils/app_text_field.dart';
import 'package:string_art/utils/navigation.dart';
import 'package:string_art/utils/show_toast.dart';
import '../../constants/assets/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _passwordVisible = true;
  bool isChecked = false;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
        ),
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
          key: _loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: appText(
                  title: texts.signIn,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AppTextField(
                validator: (val) => null,
                titleText: 'Email Address',
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
                validator: (val) => null,
                titleText: texts.password,
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
                fontSize: 15,
                title: texts.con.toUpperCase(),
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: appText(
                    title: texts.forgetPassword,
                    fontWeight: FontWeight.w600,
                    color: appColors.primary,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  appText(
                      title: texts.notUser,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  InkWell(
                      onTap: () {
                        navigateTo(
                            context: context, to: const RegisterScreen());
                      },
                      child: appText(
                        title: texts.register,
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
    if (email.text.isEmpty) {
      showToast(message: Messages.EMAIL_REQ, context: context);
    } else if (password.text.isEmpty) {
      showToast(message: Messages.PASSWORD_REQ, context: context);
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
          navigateRemoveUntil(context: context, to: const BottomNavigation());
        }
      });
    }
  }
}
