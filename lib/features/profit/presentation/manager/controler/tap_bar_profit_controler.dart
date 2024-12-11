import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';

class TapBarProfitControler extends GetxController {
  RxList<String> iteamtapbar = <String>[].obs;
  var activeIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _updateTapBarItems();
  }

  void updateTapBarOnLocaleChange() {
    _updateTapBarItems();
    update(); // لتحديث واجهة المستخدم
  }

  void setActiveIndex(int index) {
    activeIndex.value = index;
  }

  void _updateTapBarItems() {
    iteamtapbar.value = [
      getCurrentLanguage() == "en" ? "Daily" : "يومي",
      getCurrentLanguage() == "en" ? "Weekly" : "اسبوعي",
      getCurrentLanguage() == "en" ? "Monthly" : "شهري",
      getCurrentLanguage() == "en" ? "Yearly" : "سنوي"
    ];
  }
}
