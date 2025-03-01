import 'package:get/get.dart';
import 'package:horsely_app/features/account/features/payment_methods/logic/controller/add_payment_method_controller.dart';

class AddPaymentMethodBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPaymentMethodController>(
      () => AddPaymentMethodController(),
    );
  }
}


