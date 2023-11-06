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
import '../bloc/confirm_code_cubit/confirm_code_cubit.dart';
import '../bloc/forget_password_cubit/forget_password_cubit.dart';

class ConfirmCode extends StatefulWidget {
  const ConfirmCode({super.key});

  @override
  State<ConfirmCode> createState() => _ConfirmCodeState();
}

class _ConfirmCodeState extends State<ConfirmCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ConfirmCodeCubit(),
        child: BlocConsumer<ConfirmCodeCubit, ConfirmCodeState>(
          listener: (context, state) => ConfirmCodeCubit(),
          builder: (context, state) {
            var cubit = ConfirmCodeCubit.get(context);
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
                          title: AppStrings.confirmCode,
                          showBack: true),
                      SizedBox(height: 12.h),
                      CustomText(
                          title: AppStrings.weHaveSendOTPTOYourEmail,
                          style: Theme.of(context).textTheme.bodyMedium),
                      // CustomText(AppStrings.pleaseEnterYourEmailToRecieveLink,Theme.of(context).textTheme.bodyMedium),
                      // Text(
                      //   AppStrings.pleaseEnterYourEmailToRecieveLink,
                      //   maxLines: 2,
                      //   style: Theme.of(context).textTheme.bodyMedium,
                      // ),
                      Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20.h),
                            CustomField(
                              textAlign: TextAlign.center,
                              controller: cubit.codeController,
                              isObscure: false,
                              hit: 'xxxxx',
                              type: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      MainButton(
                        text: AppStrings.submit,
                        onTap: () {
                          cubit.confirmCode().then((value) => {
                                Navigator.pushNamed(
                                    context, AppRouteStrings.changePassword)
                              });
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
