import 'package:advanced_doctor_app/core/helpers/constants.dart';
import 'package:advanced_doctor_app/core/helpers/shared_pref_helper.dart';
import 'package:advanced_doctor_app/core/network/api_result.dart';
import 'package:advanced_doctor_app/core/network/dio_factory.dart';
import 'package:advanced_doctor_app/features/login/data/models/login_request_body.dart';
import 'package:advanced_doctor_app/features/login/data/repo/login_repo.dart';
import 'package:advanced_doctor_app/features/login/logic/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.initial());
    final responce = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    responce.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.userData?.token ?? '');
        emit(LoginState.loginSuccess(loginResponse));
      },
      failure: (apiErrorModel) {
        emit(LoginState.loginError(apiErrorModel));
      },
    );
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
