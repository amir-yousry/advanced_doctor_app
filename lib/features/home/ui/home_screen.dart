import 'package:advanced_doctor_app/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:advanced_doctor_app/features/home/ui/widgets/doctors_list/doctros_bloc_builder.dart';
import 'package:advanced_doctor_app/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:advanced_doctor_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:advanced_doctor_app/features/home/ui/widgets/specializations_list/specializations_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(20, 16, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              Gap(24.h),
              const DoctorsSpecialitySeeAll(),
              Gap(18.h),
              const SpecializationsBlocBuilder(),
              Gap(8.h),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
