import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/route/app_route.dart';
import '../utils/app_colors.dart';
import '../utils/assets_manger.dart';

Widget buildFloatingActionButton({required BuildContext context}) {
  return  Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 220.w,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: AppColors.greyLight ,
            ) ,
            borderRadius: BorderRadius.circular(12)
        ),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w , vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushReplacementNamed(context, AppRouteStrings.home);
              },
              child: Column(
                children: [
                  Image.asset(ImagesManger.homeIcon),
                  Text('Home' , style: TextStyle(
                      fontSize: 12.sp ,
                      color: Colors.grey
                  ),)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, AppRouteStrings.order);
              },
              child: Column(
                children: [
                  Image.asset(ImagesManger.bagIcon),
                  Text('Order' , style: TextStyle(
                      fontSize: 12.sp ,
                      color: Colors.grey

                  ),)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, AppRouteStrings.profile);
              },
              child: Column(
                children: [
                  Image.asset(ImagesManger.userIcon),
                  Text('Profile' , style: TextStyle(
                    fontSize: 12.sp ,
                    color: Colors.grey ,

                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
