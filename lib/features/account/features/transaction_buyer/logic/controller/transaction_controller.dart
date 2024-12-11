import 'package:get/get.dart';

class TransactionsController extends GetxController {
  var activeIndex = 0.obs;
  RxString coinType = ''.obs;
  RxString currency = ''.obs;
  RxString paymentType = ''.obs;

  void toggleTab(int index) {
    activeIndex.value = index;
  }
}
