import 'package:buysellgo/Models/user.dart';

import '../../Base/api_base_helper.dart';

class SignInRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Map<String, dynamic>> signIn(CustomUser user) async {
    final response = await _helper.post("/auth/login/", {
      'email': user.email,
      'password': user.password,
    });

    return response;
  }
}
