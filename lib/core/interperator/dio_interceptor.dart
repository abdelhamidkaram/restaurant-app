import 'package:dio/dio.dart';
import 'package:food/core/app_perference/app_shared_preferences.dart';
import 'package:food/core/utils/constant.dart';

class DioInterceptor extends Interceptor{

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await AppSharedPreferences.getKey(AppConstants.TOKEN);
    if(token.isNotEmpty){
      options.headers["Authorization"] = "Bearer $token";
    }
    options.headers["Content-Type"] = "application/json";
    super.onRequest(options, handler);
  }
}