import 'package:get/get.dart';
import 'package:news_trial/app/data/services/tiket_services.dart';

import '../controllers/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(
      () => LoginPageController(),
    );
    Get.put(TiketServices());
  }
}
