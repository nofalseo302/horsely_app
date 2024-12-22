import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/network_service/awesome_notifications_helper.dart';
import 'package:horsely_app/core/services/network_service/fcm_helper.dart';
import 'package:horsely_app/core/services/translation/app_translation.dart';
import 'package:horsely_app/features/account/presentation/view/account_screen.dart';
import 'package:horsely_app/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:horsely_app/routes/routes.dart';
import 'core/services/cache/cash_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  await GetStorage.init();
  await FcmHelper.initFcm();
  await AwesomeNotificationsHelper.init();
  getCurrentLanguage();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      DevicePreview(enabled: false, builder: (context) => const HorseleyApp()),
    );
  });
}

class HorseleyApp extends StatelessWidget {
  const HorseleyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String savedLanguage = box.read('language') ?? 'en';

    String fontFamily = savedLanguage == 'en' ? 'popains' : 'Cairo';
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: Locale(savedLanguage),
      fallbackLocale: const Locale('en'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: fontFamily,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      initialRoute: getInitRout(), // getInitRout(),
      getPages: AppPages.pages,
    );
  }

  getInitRout() {
    return CashHelper.getData(CacheKeys.token) != null
        ? Routes.welcome
        : Routes.welcome;
  }
}
