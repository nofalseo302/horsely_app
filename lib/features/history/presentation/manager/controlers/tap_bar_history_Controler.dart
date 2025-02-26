import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

class TapBarHistoryControler extends GetxController {
  final List iteamtapbar = [
    AppStrings.daily.tr,
    AppStrings.weekly.tr,
    AppStrings.month.tr,
    AppStrings.year.tr
  ];
  var activeIndex = 0.obs; // المتغير النشط

  void setActiveIndex(int index) {
    activeIndex.value = index;
  }
}
