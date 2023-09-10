import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/config/route/app_route.dart';
import 'package:food/core/shared_widgets/buttons/light_button.dart';
import 'package:food/core/shared_widgets/buttons/main_button.dart';
import 'package:food/core/shared_widgets/logo_with_title.dart';
import 'package:food/core/shared_widgets/title_and_sub.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_string.dart';
import 'package:food/core/utils/assets_manger.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      body: SizedBox(
       width: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 810.h,
              child: Column(
                children: [
                  SizedBox(height: 330.h, width: double.infinity,),
                  const LogoWidget(),
                  const SizedBox(height: 6,),
                  const TitleAndSub(subTitle: AppStrings.loginScreenSubTitle),
                  SizedBox(height: 36.h,),
                  MainButton(text: AppStrings.loginScreenLoginBtnTxt , onTap: (){
                    Navigator.pushNamed(context, AppRouteStrings.login);
                  }),                  SizedBox(height: 20.h,),
                 LightButton(text: AppStrings.loginScreenRegisterBtnTxt,onTap: (){
                     Navigator.pushNamed(context, AppRouteStrings.register);
                 }),
                ],
              ),
            ),
            Image.asset(ImagesManger.loginHeaderBackGround,width: 375.w , height: 475.h, fit: BoxFit.cover, alignment: Alignment.bottomCenter),


          ],
        ),
      ),
    );
  }
}

