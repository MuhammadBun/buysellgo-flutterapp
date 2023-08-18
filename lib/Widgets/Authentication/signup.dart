import 'dart:convert';

import 'package:buysellgo/Core/Constants/images_path.dart';
import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Core/Constants/text.dart';
import 'package:buysellgo/Provider/Auth%20provider/signup_provider.dart';
import 'package:buysellgo/Services/dialogs.dart';
import 'package:buysellgo/Widgets/Authentication/signin.dart';

import 'package:buysellgo/Widgets/Util/face_google_botton.dart';
import 'package:buysellgo/Widgets/Util/join_us_sign_in_button.dart';
import 'package:buysellgo/Widgets/Util/my_text_field.dart';
import 'package:buysellgo/Widgets/Util/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../API/Base/api_base_response.dart';
import '../../Services/Auth/auth_validation.dart';
import '../../Services/animate_navigation.dart';
import '../../Services/waiters/dialog_erro.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FocusNode usernameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool policyCheckValue = false;
  bool rememberCheckValue = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late ValidationSignProcess validation;

  @override
  void initState() {
    super.initState();

    validation = ValidationSignProcess(
      username: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      formKey: _formKey,
    );

    _nameController
        .addListener(() => validation.username = _nameController.text);
    _emailController
        .addListener(() => validation.email = _emailController.text);
    _passwordController
        .addListener(() => validation.password = _passwordController.text);
  }

  @override
  void dispose() {
    _nameController.dispose();
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
                  child: const Column(
                    children: [
                      MainTextStyled(text: TextsConstants.introJoinUsText),
                      SizedBox(
                        height: 10,
                      ),
                      MainTextStyled(text: TextsConstants.discoverText)
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
                const SizedBox(
                  height: 30,
                ),
                TextFormFieldForApp(
                  controller: _nameController,
                  hintText: TextsConstants.usernameText,
                  focusNode: usernameFocusNode,
                  onFieldSubmitted: (p0) {
                    FocusScope.of(context).requestFocus(emailFocusNode);
                  },
                  function: (value) => validation.validateName()
                      ? null
                      : 'Your username must be at least 6 characters.',
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
                  function: (value) =>
                      validation.validatePassword() ? null : 'Remember me',
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: ColorsConstants.primaryColor,
                        hoverColor: Colors.white,
                        side: BorderSide(color: Colors.white, width: 2),
                        value: policyCheckValue,
                        onChanged: (value) {
                          setState(() {
                            policyCheckValue = !policyCheckValue;
                          });
                        },
                        activeColor: Colors.white,
                      ),
                      const MainTextStyled(text: TextsConstants.agreeText)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: ColorsConstants.primaryColor,
                        hoverColor: Colors.white,
                        side: BorderSide(color: Colors.white, width: 2),
                        value: rememberCheckValue,
                        onChanged: (value) {
                          setState(() {
                            rememberCheckValue = !rememberCheckValue;
                          });
                        },
                        activeColor: Colors.white,
                      ),
                      const MainTextStyled(text: TextsConstants.rememberMe)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<SignUpProvider>(
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
                            .validateAndSubmitSignUp(context, value)
                            .whenComplete(() {
                          if (value.response.status == Status.completed) {
                            AnimatieNavigation.goTo(context, SignInScreen());
                          }
                        });
                      },
                      isActive: policyCheckValue,
                    );
                  },
                ),
                GestureDetector(
                    onTap: () {},
                    child: const MainTextStyled(
                        text: TextsConstants.haveAccountText))
              ],
            )),
      ),
    );
  }
}
