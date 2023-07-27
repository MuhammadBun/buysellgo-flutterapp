import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/signin_response.dart';

class SharedAppPreferences {
  static const String signInResponseKey = "sign_in_response";

  Future<void> storeSignInResponse(SignInResponse response) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(signInResponseKey, jsonEncode(response.toJson()));
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

  Future<void> deleteSignInResponse() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(signInResponseKey);
  }
}
