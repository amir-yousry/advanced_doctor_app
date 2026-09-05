import 'package:advanced_doctor_app/core/network/api_service.dart';
import 'package:advanced_doctor_app/core/network/dio_factory.dart';
import 'package:advanced_doctor_app/features/home/data/api/home_api_service.dart';
import 'package:advanced_doctor_app/features/home/data/repo/home_repo.dart';
import 'package:advanced_doctor_app/features/login/data/repo/login_repo.dart';
import 'package:advanced_doctor_app/features/login/logic/login_cubit.dart';
import 'package:advanced_doctor_app/features/signup/data/repo/signup_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));

  // Home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
}
