import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_string.dart';
import 'config/route/app_route.dart';
import 'config/theme/app_theme.dart';


class RestaurantApp extends StatelessWidget {
  const RestaurantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 810),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              theme: appTheme(),
              onGenerateRoute: AppRoute.onGenerateRoute,


          );
        }
    );
  }
}
