import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/account/domain/entity/account_entity.dart';

class MyOrderWidget extends StatelessWidget {
  const MyOrderWidget({
    super.key,
    required this.accountEntity,
  });

  final AccountEntity accountEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 4,
              spreadRadius: -1)
        ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: CircleAvatar(
                backgroundColor: AppColors.backgray,
                child: Image.asset(AppImages.myOrder),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                AppStrings.myorder.tr,
                style: AppStyles.semibold16(context),
              ),
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 15,
              child: Text(
                "3",
                style:
                    AppStyles.semibold12(context).copyWith(color: Colors.white),
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.myorder);
                },
                icon: getCurrentLanguage() == "ar"
                    ? const Icon(Icons.keyboard_arrow_left)
                    : const Icon(Icons.keyboard_arrow_right))
          ],
        ));
  }
}
