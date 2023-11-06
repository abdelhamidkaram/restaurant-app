import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/api/api_endpoint_string.dart';
import 'package:food/core/api/dio_helper.dart';
import 'package:food/core/shared_widgets/toasts.dart';
import 'package:food/features/auth/data/models/request_model/forget_password_request_model.dart';

import '../../../../core/utils/app_string.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  Future<bool> forget_password() async {
    // emit(ForgetPasswordLoading());
    ForgetPasswordRequestModel req = ForgetPasswordRequestModel(email: emailController.text);
    if(emailController.text.isEmpty){
      AppToasts.toastError(msg: AppStrings.pleaseEnter + AppStrings.email);
      return false;
    }
    try {
      await DioHelper.postData(endpoint: ApiEndPoints.forgetPassword,body: req.toJson());
      // emit(ForgetPasswordSuccess());
      // AppToasts.toastSuccess(msg: '');
      return Future(() => true);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      // emit(ForgetPasswordError());
      return Future(() => false);
    }
  }



}
