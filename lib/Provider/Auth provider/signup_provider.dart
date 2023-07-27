import 'package:buysellgo/Models/user.dart';
import 'package:flutter/foundation.dart';

import '../../API/Base/api_base_response.dart';
import '../../API/Repositories/Auth repository/signup_repository.dart';

class SignUpProvider extends ChangeNotifier {
  late SignUpRepository _signUpRepository;

  ApiResponse<Map<String, dynamic>> _response;

  ApiResponse<Map<String, dynamic>> get response => _response;

  SignUpProvider() : _response = ApiResponse.error('Not signed up yet') {
    _signUpRepository = SignUpRepository();
  }

  signUp(CustomUser user) async {
    _response = ApiResponse.loading('Signing Up');
    notifyListeners();
    try {
      print('Befor response from signup');

      var response = await _signUpRepository.signUp(user);
      print(response);
      print('after response from signup');

      _response = ApiResponse.completed(response);
      notifyListeners();
    } catch (e) {
      print(e);
      _response = ApiResponse.error(e.toString());
      notifyListeners();
    }
    return response.data;
  }

  activateTheSignUp(){
    
  }
}
