import 'dart:developer';

import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/features/profit/presentation/manager/controler/tap_bar_profit_controler.dart';

import '../../../../../core/services/translation/app_string.dart';

class HomeControler extends GetxController {
  // قائمة أسماء العناوين بناءً على الـ index
  final List<String> appBarTitles = [
    "Make P2P",
    AppStrings.wallet.tr,
    "",
    AppStrings.profit.tr,
    AppStrings.myprofile.tr
  ];

  TapBarProfitControler tapBarProfitController = TapBarProfitControler();
  int selindex = 0;
  void onItemTapped(int index) {
    selindex = index;
    update();
    if (selindex == 3) {
      tapBarProfitController.setActiveIndex(0);
      getCurrentLanguage == "en"
          ? tapBarProfitController.iteamtapbar =
              ["Daily", "Weekly", "Monthly", "Yearly"].obs
          : ["يومي", "اسبوعي", "شهري", "سنوي"].obs;
      ();
      update();
    }
  }

  void onPageChanged(int index) {
    selindex = index;

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    log(UserService.to.currentUser.value?.data?.completeDataStatus.toString() ??
        "");
  }
}
