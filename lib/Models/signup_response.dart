import 'package:buysellgo/Models/user.dart';

class SignUpResponse {
  final CustomUser user;

  SignUpResponse({required this.user});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      user: CustomUser.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
    };
  }
}
