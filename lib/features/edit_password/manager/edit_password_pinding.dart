import 'package:get/get.dart';
import 'package:horsely_app/features/account/features/information_user/presentation/controler/change_password_controller.dart';
import 'package:horsely_app/features/complete_data/manager/controller/complete_data_controller.dart';

class EditPasswordPinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPasswordController>(
      () => EditPasswordController(),
    );
  }
}
