import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/config/route/app_route.dart';
import 'package:food/core/shared_widgets/buttons/main_button.dart';
import 'package:food/core/shared_widgets/custom_field.dart';
import 'package:food/core/shared_widgets/toasts.dart';
import 'package:food/core/utils/app_colors.dart';
import 'package:food/core/utils/app_string.dart';
import 'package:food/features/auth/bloc/register_cubit/register_cubit.dart';

import '../../../core/shared_widgets/custom_toolbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterState>(
        listener: (context, state) => RegisterCubit(),
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          var formKey = cubit.formKey;
          var emailController = cubit.emailController;
          var nameController = cubit.nameController;
          var mobileController = cubit.mobileController;
          var addressController = cubit.addressController;
          var passwordController = cubit.passwordController;
          var confirmPasswordController = cubit.confirmPasswordController;
          var password = '';
          var confirmPassword = '';
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Text('Go To Home'),
              onPressed: (){
                Navigator.pushNamed(context, AppRouteStrings.home);
              },
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      // Text(
                      //   AppStrings.signUp,
                      //   style: Theme.of(context).textTheme.headlineLarge,
                      // ),
                      CustomToolbar(title: AppStrings.signUp,showBack: true),
                      SizedBox(height: 12.h),
                      Text(
                        AppStrings.registerScreenSubTitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20.h),
                            CustomField(
                                controller: nameController,
                                isObscure: false,
                                hit: AppStrings.name,
                                type: TextInputType.name),
                            SizedBox(height: 20.h),
                            CustomField(
                              controller: emailController,
                              isObscure: false,
                              hit: AppStrings.email,
                              type: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 20.h),
                            CustomField(
                                controller: mobileController,
                                isObscure: false,
                                hit: AppStrings.mobile,
                                type: TextInputType.phone),
                            SizedBox(height: 20.h),
                            CustomField(
                                controller: addressController,
                                isObscure: false,
                                hit: AppStrings.address,
                                type: TextInputType.streetAddress),
                            SizedBox(height: 20.h),
                            CustomField(
                                controller: passwordController,
                                isObscure: true,
                                onChange: (val){
                                  password = val ??'';
                                },
                                hit: AppStrings.password,
                                type: TextInputType.visiblePassword),
                            SizedBox(height: 20.h),
                            CustomField(
                                controller: confirmPasswordController,
                                isObscure: true,
                                hit: AppStrings.confirmPassword,
                                onChange: (val){
                                  confirmPassword=val??'';
                                },
                                validation: (val){
                                  if(val!.isEmpty) {
                                    return 'Empty';
                                  }
                                  if(confirmPassword != password) {
                                    return 'Not Match';
                                  }
                                  return null;
                                },
                                type: TextInputType.visiblePassword,

                            ),
                            SizedBox(height: 20.h),
                            MainButton(
                                text: AppStrings.signUp,
                                onTap: () {
                                    cubit.signUp();
                                    if (cubit.formKey.currentState!.validate()) {
                                      cubit.signUp().then((value) {
                                        if (value) {
                                          Navigator.pushNamed(
                                              context, AppRouteStrings.home);
                                        } else {
                                          AppToasts.toastError(msg: 'error ..');
                                        }
                                      });
                                    } else {
                                      AppToasts.toastError(msg: 'error ..');
                                    }
                                }),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.alreadyHaveAnAccount),
                          TextButton(
                            child: Text(AppStrings.login,
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRouteStrings.login);
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
            ),
          );
        },
      ),
    );
  }
}
