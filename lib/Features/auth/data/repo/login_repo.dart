import 'package:quent/Features/auth/data/data_source/auth_data_source.dart';
import 'package:quent/Features/auth/data/models/login_request_model.dart';
import 'package:quent/Features/auth/data/models/login_response_model.dart';
import 'package:quent/core/services/network/api_result.dart';

class LoginRepo {
  final AuthDataSource authDataSource;
  const LoginRepo({required this.authDataSource});

  Future<ApiResult<LoginResponseModel>> login({
    required LoginRequestModel body,
  }) async {
    try {
      return ApiResult.success(
        await authDataSource.login(loginRequestMode: body),
      );
    } catch (e) {
      return ApiResult.error(e);
    }
  }
}
