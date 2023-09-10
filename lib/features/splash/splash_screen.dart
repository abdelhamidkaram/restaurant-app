import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/utils/assets_manger.dart';
import '../../config/route/app_route.dart';
import '../../core/shared_widgets/logo_with_title.dart';
import '../../core/shared_widgets/title_and_sub.dart';

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
    Navigator.pushReplacementNamed(context, AppRouteStrings.welcome);

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
              fit: BoxFit.cover, ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            SizedBox(height: 6.h,),
            const TitleAndSub(subTitle: "FOOD DELIVERY",),
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

