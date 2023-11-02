import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/shared_widgets/custom_toolbar.dart';

import '../../../config/route/app_route.dart';
import '../../../core/shared_widgets/buttons/main_button.dart';
import '../../../core/shared_widgets/custom_field.dart';
import '../../../core/shared_widgets/toasts.dart';
import '../../../core/utils/app_string.dart';
import '../bloc/forget_password_cubit/forget_password_cubit.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) => ForgetPasswordCubit(),
          builder: (context, state) {
            var cubit = ForgetPasswordCubit.get(context);
            return SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomToolbar(title: AppStrings.forgetPassword, showBack: true),
                      SizedBox(height: 12.h),
                      Text(
                        AppStrings.pleaseEnter + AppStrings.email,
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
                          ],
                        ),
                      ),
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, AppRouteStrings.confirmCode);
                      }, child: Text(AppStrings.submit))
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
