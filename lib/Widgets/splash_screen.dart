import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:buysellgo/Core/Constants/images_path.dart';
import 'package:buysellgo/Core/Constants/my_colors.dart';
import 'package:buysellgo/Widgets/Authentication/signin.dart';
import 'package:buysellgo/Widgets/Home/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../Provider/shared_pref_provider/signin_response_provider.dart';

 

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInResponseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder(
          future: provider.retrieveSignInResponse(),
          builder: (context, snapshot) {
            // Determine the next screen based on whether there is user information
            final nextScreen =
                provider.signInResponse != null ? MainAppView() : SignInScreen();

            return AnimatedSplashScreen(
              backgroundColor: ColorsConstants.primaryColor,
              splash: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AssetsImageData.logoImage,
                    width: 250,
                    color: Colors.white,
                  ),
                ],
              ),
              nextScreen: nextScreen,
              splashIconSize: 250,
              splashTransition: SplashTransition.slideTransition,
              animationDuration: Duration(milliseconds: 1000),
            );
          },
        );
      },
    );
  }
}
