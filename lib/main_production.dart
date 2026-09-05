import 'package:advanced_doctor_app/core/dependency_injection/dependency_injection.dart';
import 'package:advanced_doctor_app/core/helpers/constants.dart';
import 'package:advanced_doctor_app/core/helpers/extensions.dart';
import 'package:advanced_doctor_app/core/helpers/shared_pref_helper.dart';
import 'package:advanced_doctor_app/core/routes/app_router.dart';
import 'package:advanced_doctor_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();

  runApp(DocApp(appRouter: AppRouter()));
}

Future<void> checkIfLoggedInUser() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );
  if (userToken.isNullOrEmpty()) {
    isLoggedInUser = false;
  } else {
    isLoggedInUser = true;
  }
}
