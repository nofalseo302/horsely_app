import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/cash_keys.dart';

class LanguageController extends GetxController {
  late Rxn<Locale> currentLanguage = Rxn<Locale>(
    Locale(CashHelper.getData(CacheKeys.languageCode) ?? 'en'),
  );

  void toggleLanguage() {
    currentLanguage.value = currentLanguage.value!.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    Get.updateLocale(currentLanguage.value!);
  }

  void changeLanguage(String languageCode) {
    currentLanguage.value = Locale(languageCode);
    CashHelper.setData(CacheKeys.languageCode, languageCode);
    Get.updateLocale(currentLanguage.value!);
  }

  Locale getCacheLanguage() {
    Locale locale = Locale(CashHelper.getData(CacheKeys.languageCode) ??
        currentLanguage.value!.languageCode);
    return locale;
  }

  Rxn<Color> primColor = Rxn<Color>(Colors.white);
}

