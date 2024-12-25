import 'package:get/get.dart';
import 'package:horsely_app/features/complete_data/manager/controller/complete_data_controller.dart';

class CompleteDataBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompleteDataController>(
      () => CompleteDataController(),
    );
  }
}
