import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/account/domain/entity/account_entity.dart';
import 'package:horsely_app/features/account/presentation/view/widget/iteam_account.dart';
import 'package:horsely_app/features/accout_seting.dart/presentation/manager/controler/languge_controler.dart';
import 'package:horsely_app/features/accout_seting.dart/presentation/view/widget/Iteam_languge.dart';

class BodyAccountSetting extends StatelessWidget {
  const BodyAccountSetting({super.key});

  @override
  Widget build(BuildContext context) {
    // استدعاء LanguageController باستخدام GetX
    final LanguageController languageController = Get.put(LanguageController());

    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        IteamAccount(
          accountEntity: AccountEntity(
              titel: AppStrings.accountinformation.tr,
              image: AppImages.accont,
              onPressed: () {
                Get.toNamed(Routes.informationscreen);
              }),
        ),
        IteamAccount(
          accountEntity: AccountEntity(
              titel: AppStrings.changepassword.tr,
              image: AppImages.accont,
              onPressed: () {
                Get.toNamed(Routes.changelaunge);
              }),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4,
                    spreadRadius: -3)
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.laungage.tr,
                  style: AppStyles.semibold16(context),
                ),
                const SizedBox(
                  height: 32,
                ),
                Obx(() => ItteamLanguage(
                      titel: AppStrings.english.tr,
                      isactive:
                          languageController.currentLanguage.value == 'en',
                      onTap: () {
                        languageController
                            .changeLanguage('en'); // تغيير اللغة إلى الإنجليزية
                      },
                    )),
                const SizedBox(
                  height: 32,
                ),
                Obx(() => ItteamLanguage(
                      titel: AppStrings.arabic.tr,
                      isactive:
                          languageController.currentLanguage.value == 'ar',
                      onTap: () {
                        languageController
                            .changeLanguage('ar'); // تغيير اللغة إلى العربية
                      },
                    )),
              ],
            ),
          ),
        )
      ],
    );
  }
}
