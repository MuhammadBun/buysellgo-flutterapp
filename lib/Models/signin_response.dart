import 'package:buysellgo/Models/user.dart';

class SignInResponse {
  final String expiry;
  final String token;
  final CustomUser user;

  SignInResponse(
      {required this.expiry, required this.token, required this.user});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      expiry: json['expiry'],
      token: json['token'],
      user: CustomUser.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'expiry': expiry,
      'token': token,
      'user': user.toJson(),
    };
  }
}
