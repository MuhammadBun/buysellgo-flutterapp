import 'package:buysellgo/Models/user.dart';
import 'package:flutter/cupertino.dart';

import '../../API/Base/api_base_response.dart';
import '../../API/Repositories/Auth repository/signin_repository.dart';

class SignInProvider extends ChangeNotifier {
  late SignInRepository _signInRepository;

  ApiResponse<Map<String, dynamic>> _response;

  ApiResponse<Map<String, dynamic>> get response => _response;

  SignInProvider() : _response = ApiResponse.error('Not signed in yet') {
    _signInRepository = SignInRepository();
  }

  signIn(CustomUser user) async {
    _response = ApiResponse.loading('Signing In');
    notifyListeners();
    try {
      var response = await _signInRepository.signIn(user);

      _response = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      print(e);
      _response = ApiResponse.error(e.toString());
      notifyListeners();
    }

    return response;
  }
}
