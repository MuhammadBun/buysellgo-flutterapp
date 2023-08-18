import 'package:buysellgo/Core/Constants/images_path.dart';
import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Core/Constants/text.dart';
 
import 'package:buysellgo/Services/dialogs.dart';
import 'package:buysellgo/Widgets/Home/main_screen.dart';

import 'package:buysellgo/Widgets/Util/face_google_botton.dart';
import 'package:buysellgo/Widgets/Util/join_us_sign_in_button.dart';
import 'package:buysellgo/Widgets/Util/my_text_field.dart';
import 'package:buysellgo/Widgets/Util/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../API/Base/api_base_response.dart';
import '../../Provider/Auth provider/signin_provider.dart';
import '../../Services/Auth/auth_validation.dart';
import '../../Services/animate_navigation.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late ValidationSignProcess validation;
  bool isEmptyEmail = false;
  bool isEmptyPassword = false;
  @override
  void initState() {
    super.initState();

    validation = ValidationSignProcess(
      email: _emailController.text,
      password: _passwordController.text,
      formKey: _formKey,
    );

    _emailController.addListener(() {
      validation.email = _emailController.text;
      setState(() {
        isEmptyEmail = _emailController.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      validation.password = _passwordController.text;
      setState(() {
        isEmptyPassword = _passwordController.text.isNotEmpty;
      });
    });
    setState(() {});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstants.primaryColor,
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: ColorsConstants.primaryColor,
                      borderRadius: BorderRadius.circular(40)),
                  child: SvgPicture.asset(
                    AssetsImageData.logoImage,
                    width: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      MainTextStyled(text: TextsConstants.welcomeBackText),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: MainTextStyled(
                            text: TextsConstants.underWelcomeBackText),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FacebookGoogleButton(
                      url: AssetsImageData.googleImage,
                      text: TextsConstants.googleText,
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FacebookGoogleButton(
                      url: AssetsImageData.facebookImage,
                      text: TextsConstants.facebookText,
                      onTap: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                TextFormFieldForApp(
                  controller: _emailController,
                  hintText: TextsConstants.emailText,
                  focusNode: emailFocusNode,
                  onFieldSubmitted: (p0) {
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                  function: (value) => validation.validateEmail()
                      ? null
                      : 'Please enter a valid email address.',
                ),
                TextFormFieldForApp(
                  controller: _passwordController,
                  hintText: TextsConstants.passwordText,
                  focusNode: passwordFocusNode,
                  function: (value) => validation.validatePassword()
                      ? null
                      : 'Please enter a strong password to protect your account',
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<SignInProvider>(
                  builder: (context, value, child) {
                    return JoinUsButton(
                      icon: value.response.status == Status.loading
                          ? LoadingAnimationWidget.fourRotatingDots(
                              color: Colors.black, size: 20)
                          : const Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                      text: TextsConstants.buttonJoinUsText,
                      onTap: () async {
                        await validation
                            .validateAndSubmitSignIn(context, value)
                            .whenComplete(() {
                          if (value.response.status == Status.completed) {
                            AnimatieNavigation.goTo(context, MainAppView());
                          } else if (value.response.status == Status.error &&
                              _formKey.currentState!.validate()) {
                            print(value.response.message!);
                            if (value.response.message!
                                .contains('Email does not exist')) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AnimatedErrorContainer(
                                      errorMessage:
                                          'Email not found. Please check the email address and try again.');
                                },
                              );
                            } else if (value.response.message!
                                .contains('Email does not exist')) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AnimatedErrorContainer(
                                      errorMessage:
                                          'Email not found. Please check the email address and try again.');
                                },
                              );
                            } else if (value.response.message!
                                .contains('wrong')) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AnimatedErrorContainer(
                                      errorMessage:
                                          'Invalid credentials. Please check your eamil and password and try again.');
                                },
                              );
                            } else if (value.response.message!
                                .contains('ver')) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AnimatedErrorContainer(
                                      errorMessage: TextsConstants.verfiy);
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AnimatedErrorContainer(
                                      errorMessage:
                                          "There is Error please try later.");
                                },
                              );
                            }
                          }
                        });
                      },
                      isActive: isEmptyEmail && isEmptyPassword,
                    );
                  },
                ),
                GestureDetector(
                    onTap: () {},
                    child: const MainTextStyled(
                        text: TextsConstants.doesnothaveAccountText))
              ],
            )),
      ),
    );
  }
}
