import 'package:developer_alex/network/api.dart';

class AlbumApi extends Api  {

  AlbumApi._();

  static Future<List> getAlbumList({required int userId}) async {
    final res = await Api.get('/albums',queryParameters: {
      'userId':userId
    });
    if (res is List) return res;
    return [];
  }
}