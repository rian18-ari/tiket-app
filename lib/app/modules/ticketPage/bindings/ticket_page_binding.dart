import 'package:get/get.dart';

import '../controllers/ticket_page_controller.dart';

class TicketPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketPageController>(
      () => TicketPageController(),
    );
  }
}
