import 'package:developer_alex/network/api.dart';

class PhotoApi extends Api  {

  PhotoApi._();

  static Future<List> getPhotoList({required int albumId}) async {
    final res = await Api.get('/photos',queryParameters: {
      'albumId':albumId
    });
    if (res is List) return res;
    return [];
  }
}