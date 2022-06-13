import 'package:dio/dio.dart';

class HTTPClient {
  static HTTPClient get obj => _client;

  factory HTTPClient() => _client;

  static final HTTPClient _client = HTTPClient._builder();

  late Dio _dio;

  HTTPClient._builder();

  void init({
    required BaseOptions options,
    required List<Interceptor>? interceptors,
  }) {
    _dio = Dio(options);
    interceptors?.forEach((element) {
      _dio.interceptors.add(element);
    });
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get(path, queryParameters: queryParameters, options: options, cancelToken: cancelToken,);
  }

  Future post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.post(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
