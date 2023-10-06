import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/app_cubit/app_cubit.dart';
import 'package:food/core/utils/app_string.dart';
import 'package:food/features/cart/bloc/cart_cubit.dart';
import 'config/route/app_route.dart';
import 'config/theme/app_theme.dart';

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) => AppCubit(),
        builder: (context, state) {
          return BlocConsumer<CartCubit, CartState>(
            listener: (context, state)=>CartCubit(),
            builder: (context, state) {
              return ScreenUtilInit(
                  designSize: const Size(375, 810),
                  minTextAdapt: true,
                  splitScreenMode: true,
                  builder: (context, child) {
                    return MaterialApp(
                      builder: EasyLoading.init(),
                      debugShowCheckedModeBanner: false,
                      title: AppStrings.appName,
                      theme: appTheme(),
                      onGenerateRoute: AppRoute.onGenerateRoute,
                    );
                  });
            },
          );
        },
      ),
    );
  }
}
