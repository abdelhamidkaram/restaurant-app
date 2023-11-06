import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/api/api_endpoint_string.dart';
import 'package:food/core/api/dio_helper.dart';
import 'package:food/core/app_perference/app_shared_preferences.dart';
import 'package:food/core/shared_widgets/toasts.dart';
import 'package:food/core/utils/constant.dart';
import 'package:food/features/auth/data/models/request_model/change_password_request_model.dart';
import 'package:food/features/auth/data/models/request_model/login_request_model.dart';
import 'package:food/features/auth/data/models/response_model/UserModel.dart';
import 'package:food/features/auth/data/models/response_model/loginResponse.dart';

import '../../../../core/utils/app_string.dart';

part 'change_password_state.dart';
class ChangePasswordCubit extends Cubit {
  ChangePasswordCubit(): super(ConfirmCodeInitial());

  // LoginCubit() : super(LoginInitial());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  LoginResponse? loginResponse;
  String phone = "";
  Future<bool> login() async {
    if(passwordController.text.isEmpty){
      AppToasts.toastError(msg: AppStrings.pleaseEnter + AppStrings.password);
      return false;
    }
    if(confirmPasswordController.text.isEmpty){
      AppToasts.toastError(msg: AppStrings.pleaseEnter + AppStrings.confirmPassword);
      return false;
    }
    if(passwordController.text != confirmPasswordController.text){
      AppToasts.toastError(msg: AppStrings.bothPasswordMustBeSame);
      return false;
    }

    ChangePasswordRequestModel req = ChangePasswordRequestModel(phone: phone, password: passwordController.text,confirmPassword: confirmPasswordController.text);
    try {
      var response = await DioHelper.postData(endpoint: ApiEndPoints.changePassword,body: req.toJson());
      return Future(() => true);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return Future(() => false);
    }
  }
}