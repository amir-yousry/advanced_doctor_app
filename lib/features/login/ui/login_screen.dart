import 'package:advanced_doctor_app/core/theme/styles.dart';
import 'package:advanced_doctor_app/features/login/logic/login_cubit.dart';
import 'package:advanced_doctor_app/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:advanced_doctor_app/features/login/ui/widgets/email_and_password.dart';
import 'package:advanced_doctor_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:advanced_doctor_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:advanced_doctor_app/shared/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome Back', style: AppTextStyles.font24BlueBold),
                Gap(8.h),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: AppTextStyles.font14GrayRegular,
                ),
                Gap(36.h),
                Column(
                  children: [
                    const EmailAndPassword(),
                    Gap(24.h),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyles.font13BlueRegular,
                      ),
                    ),
                    Gap(40.h),
                    AppTextButton(
                      buttonText: "Login",
                      textStyle: AppTextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    Gap(16.h),
                    const TermsAndConditionsText(),
                    Gap(60.h),
                    const DontHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
