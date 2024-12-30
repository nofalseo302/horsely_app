import 'package:get/get.dart';
import 'package:horsely_app/features/account/features/pincode/logic/controler/pin_code_controler.dart';

class PinCodePinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinCodeControler>(
      () => PinCodeControler(),
    );
  }
}
