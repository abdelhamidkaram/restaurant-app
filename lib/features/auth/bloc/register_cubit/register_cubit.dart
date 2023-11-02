import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/api/api_endpoint_string.dart';
import 'package:food/core/api/dio_helper.dart';
import 'package:food/core/app_perference/app_shared_preferences.dart';
import 'package:food/core/shared_widgets/toasts.dart';
import 'package:food/core/utils/app_string.dart';
import 'package:food/core/utils/constant.dart';
import 'package:food/features/auth/data/models/request_model/register_request_model.dart';

import '../../data/models/response_model/loginResponse.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  Future<bool> signUp() async {
    if(nameController.text.isEmpty){
      AppToasts.toastError(msg: AppStrings.pleaseEnter + AppStrings.name);
      return false;
    }
    if(emailController.text.isEmpty){
      AppToasts.toastError(msg: AppStrings.pleaseEnter + AppStrings.email);
      return false;
    }
    if(phoneController.text.isEmpty){
      AppToasts.toastError(msg: AppStrings.pleaseEnter + AppStrings.mobile);
      return false;
    }
    if(addressController.text.isEmpty){
      AppToasts.toastError(msg: AppStrings.pleaseEnter + AppStrings.address);
      return false;
    }
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

    emit(RegisterLoading());
    bool isSign = false;
    var registerRequestModel = RegisterRequestModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
      address: addressController.text,
    );

    DioHelper.postData(
            endpoint: ApiEndPoints.register,
            body: registerRequestModel.toJson())
        .then((value) {
      isSign = true;
      //TODO save user
      LoginResponse loginResponse =  value.data as LoginResponse;
      AppSharedPreferences.setKey(AppConstants.TOKEN, loginResponse.data!.jwtToken!.toString());
      emit(RegisterSuccess());
    }).catchError((e) {
      debugPrint(e.toString());
      isSign = false;
      String msg = AppStrings.internalError;
      AppToasts.toast(msg: msg);
      emit(RegisterError());
    });
    return Future.value(isSign);
  }

}
