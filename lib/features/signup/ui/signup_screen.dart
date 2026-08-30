import 'package:advanced_doctor_app/core/theme/styles.dart';
import 'package:advanced_doctor_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:advanced_doctor_app/features/signup/logic/signup_cubit.dart';
import 'package:advanced_doctor_app/features/signup/ui/widgets/already_have_account_text.dart';
import 'package:advanced_doctor_app/features/signup/ui/widgets/sign_up_bloc_listener.dart';
import 'package:advanced_doctor_app/features/signup/ui/widgets/sign_up_form.dart';
import 'package:advanced_doctor_app/shared/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
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
                Text('Create Account', style: AppTextStyles.font24BlueBold),
                Gap(8.h),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: AppTextStyles.font14GrayRegular,
                ),
                Gap(36.h),
                Column(
                  children: [
                    const SignupForm(),
                    Gap(40.h),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: AppTextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    Gap(16.h),
                    const TermsAndConditionsText(),
                    Gap(30.h),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
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
