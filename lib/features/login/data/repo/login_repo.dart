import 'package:advanced_doctor_app/core/network/api_error_handler.dart';
import 'package:advanced_doctor_app/core/network/api_result.dart';
import 'package:advanced_doctor_app/core/network/api_service.dart';
import 'package:advanced_doctor_app/features/login/data/models/login_request_body.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);

  Future<ApiResult> login(LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
