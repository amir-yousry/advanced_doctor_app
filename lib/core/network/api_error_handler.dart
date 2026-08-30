import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: "Send timeout in connection with the server",
          );
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: "Receive timeout in connection with the server",
          );
        case DioExceptionType.badCertificate:
          return ApiErrorModel(
            message: "Connection to Server failed due to bad certificate",
          );
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request to the server was cancelld");
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "Connection to Server failed");
        case DioExceptionType.unknown:
          return ApiErrorModel(
            message: "Connection to Server failed due to internet connection",
          );
        case DioExceptionType.transformTimeout:
          return ApiErrorModel(
            message: "Transform timeout in connection with the server",
          );
      }
    } else {
      return ApiErrorModel(message: "Unkown error occurred");
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  return ApiErrorModel(
    message: data['message'] ?? "Unkown error occurred",
    code: data['code'],
    errors: data['data'],
  );
}
