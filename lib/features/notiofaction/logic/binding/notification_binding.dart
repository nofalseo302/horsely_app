import 'package:get/get.dart';

import '../controller/notifcations_controller.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsController>(
      () => NotificationsController(),
    );
  }
}
