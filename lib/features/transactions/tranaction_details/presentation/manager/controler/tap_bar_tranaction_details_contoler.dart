import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';

class TapBarTranactionDetailsContoler extends GetxController {
  final List iteamtapbar = [
    getCurrentLanguage() == "en" ? "Daily" : "يومي",
    getCurrentLanguage() == "en" ? "weekly" : "اسبوعي ",
    getCurrentLanguage() == "en" ? "monthly" : "شهري",
    getCurrentLanguage() == "en" ? "yearly" : "سنوي"
  ];
  var activeIndex = 0.obs; // المتغير النشط

  void setActiveIndex(int index) {
    activeIndex.value = index; // تعيين الفهرس النشط
  }
}
