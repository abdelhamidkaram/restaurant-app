import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:food/core/api/api_endpoint_string.dart';
import 'package:food/core/interperator/dio_interceptor.dart';
import 'package:food/core/utils/app_string.dart';

import '../shared_widgets/toasts.dart';

class DioHelper {
  static Dio? dio;

  static Dio getDio(){
    if(dio == null) {
      dio = Dio(
        BaseOptions(
          baseUrl: ApiEndPoints.baseUrl,
          headers: {
            "Accept": "application/json",
          },
          connectTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 120),
        ),
      );
      dio!.interceptors.add(DioInterceptor());
      dio!.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        print("Api-Url (${options.method}) ${options.uri}");
        print("Api-handler ${options.headers}");
        print("Api-data ${options.data}");
        return handler.next(options);
      }, onResponse: (response, handler) {
        print("Api Response-statusCode ${response.statusCode}");
        print("Api Response-Url ${response.realUri}");
        print("Api Response-data ${response.data}");
        return handler.next(response);
      }, onError: (DioException e, handler) {
        print("::: Api error : $e");
        print("Api Error Status Code: ${e.response!.statusCode}");
        if(e.response!.statusCode != 500){
          AppToasts.toastError(msg: e.response!.data["message"].toString());
        }else{
          AppToasts.toastError(msg: AppStrings.pleaseTryAgain);
        }
        return handler.next(e);
      }));
    }
    return dio!;
  }



  static Future<Response> getData(
      {required String endpoint, Map<String, dynamic>? queryParameters}) {
    FocusManager.instance.primaryFocus?.unfocus();//hide keyboard
    return getDio().get(endpoint, queryParameters: queryParameters);
  }

  static Future<Response> postData(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) {
    FocusManager.instance.primaryFocus?.unfocus();//hide keyboard
    var response =
    getDio().post(endpoint, data: body, queryParameters: queryParameters);
    response.then((value) => {
      debugPrint("API ->Status->"+value.statusCode.toString())
    });
    return response;
  }

  static Future<Response> putData(
      {required String endpoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) {
    FocusManager.instance.primaryFocus?.unfocus();//hide keyboard
    return getDio().put(endpoint, data: body, queryParameters: queryParameters);
  }
}
