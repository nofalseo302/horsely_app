import 'dart:ui';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart'; // استيراد GetStorage
import 'package:horsely_app/features/account/presentation/manager/controler/account_controler.dart';
import 'package:horsely_app/features/profit/presentation/manager/controler/tap_bar_profit_controler.dart';

class LanguageController extends GetxController {
  var currentLanguage = 'en'.obs;
  final box = GetStorage(); // إنشاء مثيل لـ GetStorage

  AccountController accountController = Get.put(AccountController());
  TapBarProfitControler tapBarProfitController = TapBarProfitControler();

  @override
  void onInit() {
    super.onInit();
    // استرجاع اللغة المحفوظة
    currentLanguage.value = box.read('language') ?? 'en';
    var locale = Locale(currentLanguage.value);
    // Get.updateLocale(locale);
  }

  void changeLanguage(String languageCode) {
    currentLanguage.value = languageCode;
    var locale = Locale(languageCode);
    Get.updateLocale(locale);
    box.write('language', languageCode); // حفظ اللغة في التخزين المحلي

    accountController.updateAccountOnLocaleChange();
    print("object");
    tapBarProfitController.updateTapBarOnLocaleChange();
    print("object");
  }
}
