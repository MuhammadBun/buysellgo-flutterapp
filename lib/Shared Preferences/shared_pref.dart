import 'dart:convert';
import 'package:buysellgo/Models/signup_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/signin_response.dart';

class SharedAppPreferences {
  static const String signInResponseKey = "sign_in_response";
  static const String signUpResponseKey = "sign_up_response";

  Future<void> storeSignInResponse(SignInResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(signInResponseKey, jsonEncode(response.toJson()));
  }

  Future<void> storeSignUpResponse(SignUpResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(signUpResponseKey, jsonEncode(response.toJson()));
  }

  Future<SignInResponse?> retrieveSignInResponse() async {
    final prefs = await SharedPreferences.getInstance();
    String? responseString = prefs.getString(signInResponseKey);
    if (responseString != null) {
      return SignInResponse.fromJson(jsonDecode(responseString));
    } else {
      return null;
    }
  }

  Future<SignUpResponse?> retrieveSignUpResponse() async {
    final prefs = await SharedPreferences.getInstance();
    String? responseString = prefs.getString(signUpResponseKey);
    if (responseString != null) {
      return SignUpResponse.fromJson(jsonDecode(responseString));
    } else {
      return null;
    }
  }

  Future<void> deleteSignUpResponse() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(signInResponseKey);
  }

  Future<void> deleteSignInResponse() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(signUpResponseKey);
  }
}
