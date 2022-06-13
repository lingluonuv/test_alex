import 'package:developer_alex/routes/app_router.dart';
import 'package:get/get.dart';

class WelComeController extends GetxController {

  void toTeamPage() {
    Get.toNamed(AppRouter.team);
  }

}