import 'package:developer_alex/routes/app_router.dart';
import 'package:get/get.dart';

class NotFoundController extends GetxController {

  void backToWelcomePage() {
    Get.offAllNamed(AppRouter.root,);
  }

}