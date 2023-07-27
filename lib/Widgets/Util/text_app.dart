import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Core/Constants/my_fonts.dart';
import 'package:buysellgo/Core/Constants/text.dart';
import 'package:flutter/material.dart';

class MainTextStyled extends StatelessWidget {
  const MainTextStyled({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    Widget getTextWidget(String text) {
      switch (text) {
        case TextsConstants.introJoinUsText:
          return const Text(
            TextsConstants.introJoinUsText,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: FontsConstants.primaryFont),
          );
        case TextsConstants.discoverText:
          return const Text(
            TextsConstants.discoverText,
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          );
        case TextsConstants.googleText:
          return const Text(
            TextsConstants.googleText,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: FontsConstants.primaryFont),
          );
        case TextsConstants.facebookText:
          return const Text(
            TextsConstants.facebookText,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: FontsConstants.primaryFont),
          );
        case TextsConstants.usernameText:
          return const Text(
            TextsConstants.usernameText,
            style: TextStyle(
                color: ColorsConstants.hintTextColor,
                fontSize: 18,
                fontFamily: FontsConstants.primaryFont),
          );
        case TextsConstants.emailText:
          return TextButton(
              onPressed: () {},
              child: const Text(
                TextsConstants.emailText,
                style: TextStyle(
                    color: ColorsConstants.hintTextColor, fontSize: 18),
              ));
        case TextsConstants.passwordText:
          return const Text(
            TextsConstants.passwordText,
            style:
                TextStyle(color: ColorsConstants.hintTextColor, fontSize: 18),
          );
        case TextsConstants.forgetPasswordText:
          return const Text(
            TextsConstants.forgetPasswordText,
            style: TextStyle(
                color: ColorsConstants.primaryColor,
                fontSize: 18,
                fontFamily: FontsConstants.primaryFont),
          );
        case TextsConstants.agreeText:
          return const Text(
            TextsConstants.agreeText,
            style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: FontsConstants.primaryFont),
          );
        case TextsConstants.buttonJoinUsText:
          return const Text(
            TextsConstants.buttonJoinUsText,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: FontsConstants.primaryFont),
          );
        case TextsConstants.haveAccountText:
          return const Text(
            TextsConstants.haveAccountText,
            style: TextStyle(
                color: ColorsConstants.primaryColor,
                fontSize: 14,
                fontFamily: FontsConstants.primaryFont),
          );
        case TextsConstants.doesnothaveAccountText:
          return const Text(
            TextsConstants.doesnothaveAccountText,
            style: TextStyle(
                color: ColorsConstants.primaryColor,
                fontSize: 14,
                fontFamily: FontsConstants.primaryFont),
          );
        case TextsConstants.welcomeBackText:
          return const Text(
            TextsConstants.welcomeBackText,
            style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: FontsConstants.primaryFont,
                fontWeight: FontWeight.w100),
          );
        case TextsConstants.underWelcomeBackText:
          return const Text(
            TextsConstants.underWelcomeBackText,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          );
        case TextsConstants.logoText:
          return const Text(
            TextsConstants.logoText,
            style: TextStyle(
                color: ColorsConstants.primaryColor,
                fontSize: 18,
                fontFamily: FontsConstants.primaryFont,
                fontWeight: FontWeight.w100),
            textAlign: TextAlign.center,
          );

        case TextsConstants.buyOption:
          return const Text(
            TextsConstants.buyOption,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: FontsConstants.primaryFont,
                fontWeight: FontWeight.w100),
            textAlign: TextAlign.center,
          );
        case TextsConstants.sellOption:
          return const Text(
            TextsConstants.sellOption,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: FontsConstants.primaryFont,
                fontWeight: FontWeight.w100),
            textAlign: TextAlign.center,
          );
        case TextsConstants.loginText:
          return const Text(
            TextsConstants.loginText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: FontsConstants.primaryFont,
            ),
            textAlign: TextAlign.center,
          );
        default:
          return TextButton(
              onPressed: () {},
              child: const Text(
                "TextsConstants.introJoinUsText",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ));
      }
    }

    return getTextWidget(text);
  }
}
