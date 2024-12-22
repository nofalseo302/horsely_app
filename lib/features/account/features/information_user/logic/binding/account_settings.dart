import 'package:get/get.dart';
import 'package:horsely_app/features/account/features/information_user/presentation/controler/image_controller.dart';

class AccountSettings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageController>(
      () => ImageController(),
    );
  }
}
