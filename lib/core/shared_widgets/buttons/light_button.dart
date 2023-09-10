import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_colors.dart';

class LightButton extends StatelessWidget {
  final String text ;
  final VoidCallback onTap ;

  const LightButton({
    super.key, required this.text, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child:Container(
      width: 307.w,
      height: 60.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          border: Border.all(color: AppColors.primaryColor)
      ),
      child: Center(child: Text(text, style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: AppColors.primaryColor
      ),)),
    ));
  }
}