import 'package:get/get.dart';
import 'package:horsely_app/features/wallet/logic/controller/code_Controler.dart';

class BlanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BlancController>(BlancController());
  }
}
