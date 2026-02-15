import 'package:quent/Features/auth/data/models/toke_model.dart';
import 'package:quent/core/models/user_model.dart';

class LoginResponseModel {
  final String message;
  final UserModel user;
  final TokenModel tokens;

  LoginResponseModel({
    required this.message,
    required this.user,
    required this.tokens,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'],
      user: UserModel.fromJson(json['user']),
      tokens: TokenModel.fromJson(json['tokens']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user.toJson(),
      'tokens': tokens.toJson(),
    };
  }
}
