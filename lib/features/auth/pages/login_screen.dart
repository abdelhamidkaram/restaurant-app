import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/config/route/app_route.dart';
import 'package:food/core/shared_widgets/buttons/main_button.dart';
import 'package:food/core/shared_widgets/toasts.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_string.dart';
import 'package:food/features/auth/bloc/login_cubit/login_cubit.dart';
import '../../../core/shared_widgets/custom_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) => LoginCubit(),
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        AppStrings.login,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        AppStrings.loginScreenSubTitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20.h),
                            CustomField(
                              controller: cubit.emailController,
                              isObscure: false,
                              hit: AppStrings.email,
                              type: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 20.h),
                            CustomField(
                                controller: cubit.passwordController,
                                isObscure: true,
                                hit: AppStrings.password,
                                type: TextInputType.visiblePassword),
                            SizedBox(height: 20.h),
                            MainButton(
                                text: AppStrings.login,
                                onTap: () {
                                  // if (cubit.formKey.currentState!.validate()) {
                                  cubit.login().then((value) {
                                    if (value) {
                                      AppToasts.hideLoading();
                                      Navigator.pushNamed(
                                          context, AppRouteStrings.home);
                                    }
                                  });
                                  // }
                                }),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRouteStrings.foregetPassword);
                          },
                          child: Text(AppStrings.forgetPassword)),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.doNotHaveAccount),
                          TextButton(
                            child: const Text(AppStrings.signUp),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouteStrings.register);
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
