import 'package:get/get.dart';

import '../controller/forget_password_controller.dart';

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordController>(
      () => ForgetPasswordController(),
    );
  }
}
