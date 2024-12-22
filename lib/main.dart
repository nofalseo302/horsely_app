import 'dart:convert';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/services/network_service/awesome_notifications_helper.dart';
import 'package:horsely_app/core/services/network_service/fcm_helper.dart';
import 'package:horsely_app/core/services/translation/app_translation.dart';
import 'package:horsely_app/features/account/presentation/view/account_screen.dart';
import 'package:horsely_app/features/auth/data/model/user_model.dart';
import 'package:horsely_app/routes/app_pages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:horsely_app/routes/routes.dart';
import 'core/services/cache/cash_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();

  await GetStorage.init();
  await FcmHelper.initFcm();

  await Get.putAsync(() => UserService().init());
  UserModel? userModel = UserService.to.currentUser?.value;
  await AwesomeNotificationsHelper.init();
  getCurrentLanguage();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      DevicePreview(
          enabled: false,
          builder: (context) => HorseleyApp(userModel: userModel)),
    );
  });
}

class HorseleyApp extends StatelessWidget {
  HorseleyApp({super.key, this.userModel});
  final box = GetStorage();
  final UserModel? userModel;
  @override
  Widget build(BuildContext context) {
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
      initialRoute: getRoute(userModel), // getInitRout(),
      getPages: AppPages.pages,
    );
  }

  String getRoute(UserModel? userModel) {
    if (userModel == null) {
      return Routes.login;
    } else if (userModel.data?.emailVerifiedAt == false) {
      return Routes.verifyAccount;
    } else if (userModel.data?.isPlanSubscribe == false) {
      return Routes.pindingcompletedata;
    } else {
      return Routes.home;
    }
  }
}
