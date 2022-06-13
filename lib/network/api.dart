import 'package:developer_alex/network/http_client.dart';
import 'package:dio/dio.dart';

class Api {
  static Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    final Response resp = await HTTPClient.obj.get(path, queryParameters: queryParameters);
    return resp.data;
  }

  static Future post(String path, {data, Map<String, dynamic>? queryParameters}) async {
    final Response resp = await HTTPClient.obj.post(path, data: data, queryParameters: queryParameters);
    return resp.data;
  }
}
