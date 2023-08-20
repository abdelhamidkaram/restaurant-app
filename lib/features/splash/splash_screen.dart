import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/assets_manger.dart';

import '../../config/route/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer? _timer;


  _startDelay() {
    _timer = Timer( const Duration(seconds: 5), _goNext);
  }

  _goNext() async {
    Navigator.pushReplacementNamed(context, AppRouteStrings.login);

  }


  @override
  void initState() {
    _startDelay();

    super.initState();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset(ImagesManger.splashBackground).image,
              fit: BoxFit.cover,
              opacity: 0.10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 74.h,
              child: Text('logo app' , style: TextStyle(
                fontSize: 12.sp
              ),),
            ),
            SizedBox(height: 6.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("restaurant", style: Theme.of(context).textTheme.titleLarge,),
                SizedBox(
                  width: 9.w,
                ),
                Text("App", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: AppColors.primaryDark
                )),

              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Text("FOOD DELIVERY", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: AppColors.primaryDark,
                fontSize: 10.sp
            )),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
