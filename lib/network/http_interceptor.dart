import 'package:developer_alex/app_config.dart';
import 'package:dio/dio.dart';

class HttpInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (AppConfig.isDebug) {
      print('Dio on request');
    }

    ///any setting in here

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (AppConfig.isDebug) {
      print('Dio on response');
    }

    ///any setting in here

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (AppConfig.isDebug) {
      print('Dio on err');
    }

    ///any setting in here

    handler.next(err);
  }

}