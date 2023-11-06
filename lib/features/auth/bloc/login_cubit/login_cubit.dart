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
import 'package:food/features/auth/data/models/request_model/login_request_model.dart';
import 'package:food/features/auth/data/models/response_model/UserModel.dart';
import 'package:food/features/auth/data/models/response_model/loginResponse.dart';

import '../../../../core/utils/app_string.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginResponse? loginResponse;

  Future<bool> login() async {
    if(emailController.text.isEmpty){
      AppToasts.toastError(msg: AppStrings.pleaseEnter + AppStrings.email);
      return false;
    }
    if(passwordController.text.isEmpty){
      AppToasts.toastError(msg: AppStrings.pleaseEnter + AppStrings.password);
      return false;
    }
    // emit(LoginLoading());
    // AppToasts.toastLoading();
    LoginRequestModel req = LoginRequestModel(email: emailController.text, password: passwordController.text);
    try {
      var response = await DioHelper.postData(endpoint: ApiEndPoints.login,body: req.toJson());
      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      await AppSharedPreferences.saveUser(AppConstants.USER, loginResponse.data!);
      emit(LoginSuccess());
      return Future(() => true);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(LoginError());
      return Future(() => false);
    }
  }
}