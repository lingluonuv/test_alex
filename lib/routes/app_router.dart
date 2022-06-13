import 'package:developer_alex/pages/album/album_page.dart';
import 'package:developer_alex/pages/detail/detail_page.dart';
import 'package:developer_alex/pages/not_found/not_found.dart';
import 'package:developer_alex/pages/team/team_page.dart';
import 'package:get/get.dart';

import '../pages/welcome/welcome_page.dart';

class AppRouter {

  ///names defined
  static const String root = '/';

  static const String team = '/team';

  static const String detail = '/detail';

  static const String album = '/album';

  static const String notfound = '/notfound';

  ///404
  static GetPage unknownPage = GetPage(name: notfound, page: ()=>const NotFoundPage());

  ///routes
  static List<GetPage<dynamic>> get routes => <GetPage<dynamic>>[

    GetPage(name: root, page: ()=>const WelComePage()),

    GetPage(name: team, page: ()=>const TeamPage()),

    GetPage(name: detail, page: ()=>const DetailPage()),

    GetPage(name: album, page: ()=>const AlbumPage()),
  ];
}