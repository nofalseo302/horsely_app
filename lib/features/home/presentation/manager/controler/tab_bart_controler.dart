import 'package:get/get.dart';

class TapBarController extends GetxController {
  var activeIndex = 0.obs; // لتمثيل التاب النشط

  void toggleTab(int index) {
    activeIndex.value = index; // تغيير التاب النشط
  }
}
