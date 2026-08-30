import 'package:advanced_doctor_app/core/network/api_error_handler.dart';
import 'package:advanced_doctor_app/core/network/api_result.dart';
import 'package:advanced_doctor_app/core/network/api_service.dart';
import 'package:advanced_doctor_app/features/signup/data/models/signup_request_body.dart';
import 'package:advanced_doctor_app/features/signup/data/models/signup_responce.dart';

class SignupRepo {
  final ApiService _apiService;
  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponce>> signup(
    SignupRequestBody signupRequestBody,
  ) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
