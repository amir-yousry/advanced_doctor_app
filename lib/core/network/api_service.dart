import 'package:advanced_doctor_app/core/network/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
/*
  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );*/
/*
  @POST(ApiConstants.signup)
  Future<SignupResponce> signup(
    @Body() SignupRequestBody signupRequestBody,
  );*/
}
