import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/api/api_endpoint_string.dart';
import 'package:food/core/api/dio_helper.dart';
import 'package:food/core/shared_widgets/toasts.dart';
import 'package:food/core/utils/app_string.dart';
import 'package:food/features/auth/data/models/request_model/register_request_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  Future<bool> signUp() async {

    emit(RegisterLoading());
    bool isSign = false;
    var registerRequestModel = RegisterRequestModel(
      email: emailController.text,
      name: nameController.text,
      address: addressController.text,
      mobile: mobileController.text,
      password: passwordController.text,
    );

    DioHelper.postData(
            endpoint: ApiEndPoints.register,
            body: registerRequestModel.toJson())
        .then((value) {
      isSign = true;
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
