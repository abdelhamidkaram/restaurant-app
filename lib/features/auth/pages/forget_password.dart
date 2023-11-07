import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food/core/shared_widgets/custom_text.dart';
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
                      CustomToolbar(
                          title: AppStrings.forgetPasswordTitle,
                          showBack: true),
                      SizedBox(height: 30.h),
                      CustomText(
                          title: AppStrings.pleaseEnterYourEmailToRecieveLink,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,fontSize: 20),
                      // CustomText(AppStrings.pleaseEnterYourEmailToRecieveLink,Theme.of(context).textTheme.bodyMedium),
                      // Text(
                      //   AppStrings.pleaseEnterYourEmailToRecieveLink,
                      //   maxLines: 2,
                      //   style: Theme.of(context).textTheme.bodyMedium,
                      // ),
                      SizedBox(height: 15.h),
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
                      SizedBox(
                        height: 20.h,
                      ),
                      MainButton(
                        text: AppStrings.submit,
                        onTap: () {
                          cubit.forget_password().then((value) => {
                            Navigator.pushNamed(
                                    context, AppRouteStrings.confirmCode,arguments: cubit.emailController.text)
                              }
                            );
                        },
                      )
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
