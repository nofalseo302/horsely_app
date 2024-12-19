import 'package:get/get.dart';

class TransactionController extends GetxController {
  var activeIndex = 0.obs;
  RxString coinType = "".obs;
  RxString currency = "".obs;
  RxString paymethod = "".obs;

  void toggleTab(int index) => activeIndex.value = index;
}
