import 'package:get/get.dart';

String getCurrentLanguage() {
  return Get.locale?.languageCode ?? 'en';
}
