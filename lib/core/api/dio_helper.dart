import 'package:dio/dio.dart';
import 'package:food/core/api/api_endpoint_string.dart';

class  DioHelper{

  static Dio dio = Dio(BaseOptions(
    baseUrl: ApiEndPoints.baseUrl,
      headers: {
        "Accept": "application/json",
      },
    connectTimeout: const Duration(seconds: 60),
    sendTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 120),
  ),);



  static Future<Response> getData({required String endpoint , Map<String, dynamic>? queryParameters}){
  return dio.get(endpoint , queryParameters: queryParameters);
  }

  static Future<Response> postData({required String endpoint , Map<String, dynamic>? queryParameters , Map<String, dynamic>? body}){
    return dio.post(endpoint , data: body , queryParameters: queryParameters);
  }

  static Future<Response> putData({required String endpoint , Map<String, dynamic>? queryParameters , Map<String, dynamic>? body}){
    return dio.put(endpoint , data: body , queryParameters: queryParameters);
  }


}