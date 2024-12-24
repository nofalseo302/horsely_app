import 'package:get/get.dart';
import 'package:horsely_app/features/account/features/verification_status/logic/controller/verification_status_controller.dart';

class VerificationStatusBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationStatusController>(
      () => VerificationStatusController(),
    );
  }
}
