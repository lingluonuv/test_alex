
import 'package:developer_alex/network/api.dart';

class UserApi extends Api  {

  UserApi._();

  static Future<List> getUserList() async {
      final res = await Api.get('/users');
      if (res is List) return res;
      return [];
  }

}