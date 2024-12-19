import 'package:get/get.dart';
import 'package:horsely_app/features/account/features/transaction/logic/controller/transaction_controller.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(
      () => TransactionController(),
    );
  }
}
