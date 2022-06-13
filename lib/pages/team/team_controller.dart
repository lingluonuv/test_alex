import 'package:developer_alex/entitys/user_entity.dart';
import 'package:developer_alex/network/apis/user.dart';
import 'package:developer_alex/routes/app_router.dart';
import 'package:get/get.dart';

class TeamController extends GetxController {

  ///User list
  List<UserEntity> userList = <UserEntity>[];

  ///Init
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  ///Get user list from api
  Future<dynamic> loadData() async {
    try {
      List res = await UserApi.getUserList();
      userList = res.map((e) => UserEntity.fromJson(e)).toList();
      update();
    }catch (e) {
      //error handler
      print('$e');
    }
  }

  ///To detail page
  void toDetailPage({required UserEntity user}) {
    Get.toNamed(AppRouter.detail,arguments: user);
  }

}