import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/features/account/features/account_setting.dart/presentation/manager/controler/languge_controler.dart';

import '../../../../core/utils/app_text_styles.dart';

class IteamFristWallet extends StatelessWidget {
  const IteamFristWallet({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 3,
                spreadRadius: -4),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xffE9EFF5).withOpacity(.9),
            radius: 25,
            child: const CustomImageHandler(AppImages.pitcont),
          ),
          title: Text(
            "BTC",
            style: AppStyles.semibold20(context),
          ),
          subtitle: Text(
            "Ethereum",
            style: AppStyles.semibold14(context)
                .copyWith(color: const Color(0xff8A8A8A)),
          ),
          trailing: Icon(
              LanguageController().currentLanguage.value?.languageCode == "ar"
                  ? Icons.keyboard_arrow_left
                  : Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
