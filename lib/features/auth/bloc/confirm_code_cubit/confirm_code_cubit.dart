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
import 'package:food/features/auth/data/models/response_model/loginResponse.dart';

import '../../../../core/utils/app_string.dart';
import '../../data/models/request_model/confirm_code_request_model.dart';
part 'confirm_code_state.dart';

class ConfirmCodeCubit extends Cubit<ConfirmCodeState> {
  ConfirmCodeCubit() : super(ConfirmCodeInitial());

  String email = "";
  static ConfirmCodeCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var codeController = TextEditingController();
  LoginResponse? loginResponse;
  String phone = "";
  Future<bool> confirmCode() async {
    if(codeController.text.isEmpty){
      AppToasts.toastError(msg: AppStrings.pleaseEnter + AppStrings.code);
      return false;
    }

    ConfirmCodeRequestModel req = ConfirmCodeRequestModel(email: email , code: codeController.text);
    try {
      var response = await DioHelper.postData(endpoint: ApiEndPoints.activateCode,body: req.toJson());
      return Future(() => true);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return Future(() => false);
    }
  }
}