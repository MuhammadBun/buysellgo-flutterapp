import 'package:buysellgo/Models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../API/Base/api_base_response.dart';
import '../../Provider/Auth provider/signin_provider.dart';
import '../../Provider/Auth provider/signup_provider.dart';
import '../../Widgets/Authentication/signin.dart';
import '../animate_navigation.dart';
import '../dialogs.dart';

class ValidationSignProcess {
  String email;
  String password;
  String username;
  GlobalKey<FormState> formKey;

  ValidationSignProcess(
      {required this.username,
      required this.email,
      required this.password,
      required this.formKey});
  validateAndSubmitSignUp(
      BuildContext context, SignUpProvider signUpProvider) async {
    if (formKey.currentState!.validate()) {
      await signUpProvider.signUp(
          CustomUser(email: email, password: password, username: username));
    }
  }

  validateAndSubmitSignIn(BuildContext context) async {
    if (formKey!.currentState!.validate()) {
      SignInProvider signInProvider =
          Provider.of<SignInProvider>(context, listen: false);

      await signInProvider.signIn(CustomUser(email: email, password: password));
      if (signInProvider.response.status == Status.completed) {}
    }
  }

  bool validateName() {
    if (username.isEmpty) {
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
