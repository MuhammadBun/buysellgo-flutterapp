import 'package:buysellgo/Provider/shared_pref_provider/sign_in_response_status.dart';
import 'package:flutter/foundation.dart';
import '../../Models/signin_response.dart';
import '../../Shared Preferences/shared_pref.dart';

class SignInResponseProvider extends ChangeNotifier {
  final SharedAppPreferences _sharedPrefs = SharedAppPreferences();
  SignInResponse? _signInResponse;
  SignInResponseStatus _status = SignInResponseStatus.notExist;

  SignInResponse? get signInResponse => _signInResponse;
  SignInResponseStatus get status => _status;

  Future<void> storeSignInResponse(SignInResponse response) async {
    await _sharedPrefs.storeSignInResponse(response);
    _signInResponse = response;
    _status = SignInResponseStatus.exist;
    notifyListeners();
  }

  Future<SignInResponse?> retrieveSignInResponse() async {
    _signInResponse = await _sharedPrefs.retrieveSignInResponse();
    _status = _signInResponse != null
        ? SignInResponseStatus.exist
        : SignInResponseStatus.notExist;
    return signInResponse;
  }

  Future<void> deleteSignInResponse() async {
    await _sharedPrefs.deleteSignInResponse();
    _signInResponse = null;
    _status = SignInResponseStatus.notExist;
    notifyListeners();
  }
}
