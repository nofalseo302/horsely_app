import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_ar.dart';
import 'package:horsely_app/core/services/translation/app_en.dart';

class AppTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": AppAr.translation,
        "en": AppEn.translation,
      };
}
