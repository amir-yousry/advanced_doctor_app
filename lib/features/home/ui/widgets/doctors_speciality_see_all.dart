import 'package:advanced_doctor_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialitySeeAll extends StatelessWidget {
  const DoctorsSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Doctors Speciality', style: AppTextStyles.font18DarkBlueSemiBold),
        const Spacer(),
        Text('See All', style: AppTextStyles.font12BlueRegular),
      ],
    );
  }
}
