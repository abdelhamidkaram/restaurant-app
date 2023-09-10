
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_colors.dart';


class MainButton extends StatelessWidget {
  final String text ;
  final VoidCallback onTap ;
  const MainButton({
    super.key, required this.text, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 307.w,
        height: 60.h,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(28.r)
        ),

        child: Center(child: Text(text , style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.white
        ),)),
      ),
    );
  }
}
