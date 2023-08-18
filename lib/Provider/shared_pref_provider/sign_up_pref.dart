import 'package:buysellgo/Models/signup_response.dart';

import 'package:buysellgo/Provider/shared_pref_provider/sign_up_response_status.dart';
import 'package:flutter/foundation.dart';

import '../../Shared Preferences/shared_pref.dart';

class SignUpResponseProvider extends ChangeNotifier {
  final SharedAppPreferences _sharedPrefs = SharedAppPreferences();
  SignUpResponse? _signUpResponse;
  SignUpResponseStatus _status = SignUpResponseStatus.notExist;

  SignUpResponse? get signUpResponse => _signUpResponse;
  SignUpResponseStatus get status => _status;

  Future<void> storeSignUpResponse(SignUpResponse response) async {
    await _sharedPrefs.storeSignUpResponse(response);
    _signUpResponse = response;
    _status = SignUpResponseStatus.exist;
    notifyListeners();
  }

  Future<SignUpResponse?> retrieveSignUpResponse() async {
    _signUpResponse = await _sharedPrefs.retrieveSignUpResponse();
    _status = _signUpResponse != null
        ? SignUpResponseStatus.exist
        : SignUpResponseStatus.notExist;
    return signUpResponse;
  }

  Future<void> deleteSignUpResponse() async {
    await _sharedPrefs.deleteSignInResponse();
    _signUpResponse = null;
    _status = SignUpResponseStatus.notExist;
    notifyListeners();
  }
}
