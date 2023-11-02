import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/api/api_endpoint_string.dart';
import 'package:food/core/api/dio_helper.dart';
import 'package:food/core/shared_widgets/toasts.dart';
import 'package:food/features/auth/data/models/request_model/login_request_model.dart';
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
    emit(LoginLoading());
    AppToasts.toastLoading();
    LoginRequestModel req = LoginRequestModel(
        email: emailController.text, password: passwordController.text);
    try {
      var response = await DioHelper.postData(endpoint: ApiEndPoints.login,body: req.toJson());
      print("==>>"+response.data);
      emit(LoginSuccess());
      loginResponse = response.data as LoginResponse;
      //TODO save user in session
      // AppToasts.toastSuccess(msg: loginResponse?.message??"");
      return Future(() => true);
    } on LoginResponseError catch (e) {
      print("==>>ERROR "+e.message.toString());
      if (kDebugMode) {
        print(e.toString());
      }
      AppToasts.toastError(msg: AppStrings.pleaseTryAgain);
      emit(LoginError());
      return Future(() => false);
    }
  }


}

class LoginResponseError implements Exception{
  int? status;
  String? message;
}
