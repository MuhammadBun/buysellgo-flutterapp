import 'package:buysellgo/Models/signin_response.dart';
import 'package:buysellgo/Models/signup_response.dart';
import 'package:buysellgo/Models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:provider/provider.dart';

import '../../API/Base/api_base_response.dart';
import '../../Provider/Auth provider/signin_provider.dart';
import '../../Provider/Auth provider/signup_provider.dart';
import '../../Provider/shared_pref_provider/sign_up_pref.dart';
import '../../Provider/shared_pref_provider/signin_response_provider.dart';
import '../../Widgets/Authentication/signin.dart';
import '../animate_navigation.dart';
import '../dialogs.dart';

class ValidationSignProcess {
  String email;
  String password;
  String? username;
  GlobalKey<FormState> formKey;

  ValidationSignProcess(
      {this.username,
      required this.email,
      required this.password,
      required this.formKey});
  validateAndSubmitSignUp(
      BuildContext context, SignUpProvider signUpProvider) async {
    if (formKey.currentState!.validate()) {
      SignUpResponseProvider signUpResponseProvider = SignUpResponseProvider();
      await signUpProvider.signUp(
          CustomUser(email: email, password: password, username: username));
      SignUpResponse signUpResponse =
          SignUpResponse(user: CustomUser(email: email, password: password));
      await signUpResponseProvider.storeSignUpResponse(signUpResponse);
      //here i need to use the calss that i mentioned
    }
  }

  validateAndSubmitSignIn(
      BuildContext context, SignInProvider signInProvider) async {
    if (formKey.currentState!.validate()) {
      SignInResponseProvider signInResponseProvider = SignInResponseProvider();

      final response = await signInProvider
          .signIn(CustomUser(email: email, password: password));
      try {
        print(response);
        final userInfo = response.data['user'];
        final customUser = CustomUser.fromJson(userInfo);
        final token = response.data['token'];
        final expiry = response.data['expiry'];
        SignInResponse signUpResponse =
            SignInResponse(user: customUser, token: token, expiry: expiry);
        print("token : ");

        print(token);
        await signInResponseProvider.storeSignInResponse(signUpResponse);
      } catch (e) {
        print("error ::: ");

        print(e);
      }
    }
  }

  bool validateName() {
    if (username!.length < 6) {
      return false;
    }
    return true;
  }

  bool validateEmail() {
    if (email.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return false;
    }
    return true;
  }

  bool validatePassword() {
    if (password.isEmpty || password.length < 8) {
      return false;
    }
    return true;
  }
}
