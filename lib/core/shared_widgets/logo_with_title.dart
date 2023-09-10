import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_string.dart';

class LogoWidget extends StatelessWidget {
  final String title;
   const LogoWidget({
    super.key,
    this.title = AppStrings.appName,

  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.primaryColor,
      radius: 74.w,
      child: Text(title , style: TextStyle(
          fontSize: 12.sp,
          color: Colors.white
      ),),
    );
  }
}
