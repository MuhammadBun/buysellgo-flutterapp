import 'package:buysellgo/Core/Constants/images_path.dart';
import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Core/Constants/text.dart';
import 'package:buysellgo/Widgets/Authentication/signup.dart';

import 'package:buysellgo/Widgets/Home/main_screen.dart';
import 'package:buysellgo/Widgets/Util/face_google_botton.dart';
import 'package:buysellgo/Widgets/Util/join_us_sign_in_button.dart';
import 'package:buysellgo/Widgets/Util/my_text_field.dart';
import 'package:buysellgo/Widgets/Util/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FocusNode usernameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
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
                  MainTextStyled(text: TextsConstants.welcomeBackText),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: MainTextStyled(
                        text: TextsConstants.underWelcomeBackText),
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
                  onTap: () {
                    setState(() {});
                  },
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
              controller: usernameTextEditingController,
              hintText: TextsConstants.usernameText,
              focusNode: usernameFocusNode,
              onFieldSubmitted: (p0) {
                FocusScope.of(context).requestFocus(emailFocusNode);
              },
            ),
            TextFormFieldForApp(
              controller: emailTextEditingController,
              hintText: TextsConstants.emailText,
              focusNode: emailFocusNode,
              onFieldSubmitted: (p0) {
                FocusScope.of(context).requestFocus();
              },
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    hoverColor: ColorsConstants.primaryColor,
                    side: BorderSide(
                        color: ColorsConstants.primaryColor, width: 2),
                    value: checkValue,
                    onChanged: (value) {
                      setState(() {
                        checkValue = !checkValue;
                      });
                    },
                    activeColor: ColorsConstants.primaryColor,
                  ),
                  const MainTextStyled(text: TextsConstants.agreeText)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            JoinUsButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              text: TextsConstants.loginText,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const MainAppView(),
                    ));
              },
              isActive: true,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SignUpScreen(),
                      ));
                },
                child: const MainTextStyled(
                    text: TextsConstants.doesnothaveAccountText))
          ],
        )),
      ),
    );
  }
}
