import 'package:buysellgo/Models/user.dart';

import '../../Base/api_base_helper.dart';

class SignUpRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Map<String, dynamic>> signUp(CustomUser user) async {
    final response = await _helper.post("/auth/create-user/", {
      'username': user.username!,
      'email': user.email,
      'password': user.password,
    });

    if (response == null) {
      throw Exception(
          'An error occurred while signing up. Please try again later.');
    } else {
      return response;
    }
  }
}
