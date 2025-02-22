import 'package:get/get.dart';
import 'package:horsely_app/features/account/features/pincode/logic/controler/pin_code_controller.dart';

class PinCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinCodeController>(
      () => PinCodeController(),
    );
  }
}
