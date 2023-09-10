import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/api/api_endpoint_string.dart';
import 'package:food/core/api/dio_helper.dart';
import 'package:food/core/shared_widgets/toasts.dart';
import 'package:food/features/auth/data/models/request_model/login_request_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<bool> login() async {
    emit(LoginLoading());
    AppToasts.toastLoading();
    LoginRequestModel req = LoginRequestModel(
        email: emailController.text, password: passwordController.text);
    try {
      await DioHelper.postData(endpoint: ApiEndPoints.login,body: req.toJson());
      emit(LoginSuccess());
      AppToasts.toastSuccess(msg: '');
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
