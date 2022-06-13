
import 'package:developer_alex/common/Themes/colors.dart';
import 'package:developer_alex/network/http_client.dart';
import 'package:developer_alex/routes/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'network/http_interceptor.dart';

///App env
enum AppEnvEnum {
  dev,
  prod
}

///Application configuration class
class AppConfig {

  ///Compiled mod
  static const isRelease = kReleaseMode;
  static const isDebug = kDebugMode;
  static const isProfile = kProfileMode;

  ///Base url
  static const devBaseUrl = 'https://jsonplaceholder.typicode.com';
  static const prodBaseUrl = 'https://jsonplaceholder.typicode.com';

  ///Env default is dev
  static AppEnvEnum _env = AppEnvEnum.dev;
  static AppEnvEnum get env => _env;

  ///Instance of AppConfig
  static AppConfig get obj => _config;

  factory AppConfig() => _config;

  static final AppConfig _config = AppConfig._builder();

  AppConfig._builder();

  ///Setup app env
  AppConfig start({required AppEnvEnum env}) {
    _env = env;
    return _config;
  }

  ///Setup http client
  AppConfig setupHTTPClient() {

    /// Any http configuration setting in here
    final BaseOptions options = BaseOptions(
      baseUrl: _env==AppEnvEnum.dev ? devBaseUrl : prodBaseUrl,
      sendTimeout:15000,
      connectTimeout: 15000,
      receiveTimeout: 15000,
    );

    final HttpInterceptor interceptor = HttpInterceptor();

    HTTPClient.obj.init(options: options, interceptors: [interceptor]);
    return _config;
  }

  ///Call the method after all configuration done
  void run() {
    runApp(GetMaterialApp(
      theme: ThemeData(
          fontFamily: 'Inter',
          scaffoldBackgroundColor: ThemeColors.white,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: ThemeColors.ff333333),
            actionsIconTheme: IconThemeData(color: ThemeColors.ff333333),
            backgroundColor: ThemeColors.white,
            elevation: 1,
            titleTextStyle: TextStyle(
              color: ThemeColors.ff333333,
              fontSize: 18,
              fontWeight: FontWeight.bold
            )
          ),
      ),
      initialRoute: '/',
      unknownRoute: AppRouter.unknownPage,
      getPages: AppRouter.routes,
    ));
  }

}