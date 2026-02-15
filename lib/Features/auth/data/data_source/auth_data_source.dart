import 'package:dio/dio.dart';
import 'package:quent/Features/auth/data/models/login_request_model.dart';
import 'package:quent/Features/auth/data/models/login_response_model.dart';
import 'package:quent/core/constants/api_end_points.dart';
import 'package:quent/core/services/network/api_service.dart';

class AuthDataSource {
  final ApiService apiService;
  const AuthDataSource({required this.apiService});

  Future<LoginResponseModel> login({
    required LoginRequestModel loginRequestMode,
  }) async {
    final Response response = await apiService.post(
      ApiEndPoints.login,
      data: loginRequestMode.toJson(),
    );

    return LoginResponseModel.fromJson(response.data);
  }

  Future<void> logout() async {
      await apiService.post(ApiEndPoints.logout);
  }

}
