import 'package:get/get.dart';
import 'package:horsely_app/features/auth/logic/controller/local_auth_controller.dart';

class LocalAuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalAuthController>(
      () => LocalAuthController(),
    );
  }
}
