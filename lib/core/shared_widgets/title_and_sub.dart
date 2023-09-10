import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_string.dart';
import '../utils/app_colors.dart';

class TitleAndSub extends StatelessWidget {
  final String titleWordOne ;
  final String titleWordTwo ;
  final String subTitle ;
  const TitleAndSub({
    super.key,
    this.titleWordOne = AppStrings.appName,
    this.titleWordTwo = AppStrings.app,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(titleWordOne, style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(
              width: 9.w,
            ),
            Text(titleWordTwo, style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.primaryFontColor,
            )),

          ],
        ),
        SizedBox(
          height: 6.h,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 52.0.w),
          child: Text(subTitle,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.secondaryFontColor,
              fontSize: 13.sp,
          )),
        ),
      ],
    );
  }
}

