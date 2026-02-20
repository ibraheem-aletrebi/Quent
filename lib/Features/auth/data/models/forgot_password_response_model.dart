class ForgotPasswordResponseModel {
  final String message;
  final String code;
  final String resetToken;

  ForgotPasswordResponseModel({
    required this.message,
    required this.code,
    required this.resetToken,
  });

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponseModel(
      message: json['message'],
      code: json['code'],
      resetToken: json['reset_token'],
    );
  }
}
