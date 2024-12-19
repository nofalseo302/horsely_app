import 'package:get/get.dart';
import 'package:horsely_app/features/account/features/myorder/logic/controler/my_order_controller.dart';

class MyOrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyOrderController>(
      () => MyOrderController(),
    );
  }
}
