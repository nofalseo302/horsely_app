import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_function.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/account/features/support/domain/entity/support_entity.dart';
import 'package:horsely_app/features/account/features/support/presentation/view/widget/iteam_support.dart';

class BodySupport extends StatelessWidget {
  const BodySupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        IteamSupport(
          accountEntity: SupportEntity(
              titel: AppStrings.email.tr,
              image: AppImages.email,
              onPressed: () {
                AppFunctions.launchEmail("nofalseo302@gmail.com");
              },
              subtitel: 'Horsley.me@Gmail.com'),
        ),
        const SizedBox(
          height: 8,
        ),
        IteamSupport(
          accountEntity: SupportEntity(
              titel: AppStrings.phone.tr,
              image: AppImages.call,
              onPressed: () {
                AppFunctions.launchPhone("010222522");
              },
              subtitel: "+ 19810039840"),
        ),
        const SizedBox(
          height: 8,
        ),
        IteamSupport(
          accountEntity: SupportEntity(
              titel: AppStrings.livechat.tr,
              image: AppImages.chats,
              onPressed: () {
                Get.toNamed(Routes.livechat);
              },
              subtitel: 'Online'),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}
