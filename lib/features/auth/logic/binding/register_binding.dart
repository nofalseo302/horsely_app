import 'package:get/get.dart';
import 'package:horsely_app/features/auth/logic/controller/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<RegisterController>()) {
      Get.put<RegisterController>(RegisterController(), permanent: true);
    }
  }
}
