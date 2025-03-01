import 'package:get/get.dart';
import 'package:horsely_app/features/account/features/offer/logic/controller/offers_controller.dart';

class OffersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OffersController>(
      () => OffersController(),
    );
  }
}
