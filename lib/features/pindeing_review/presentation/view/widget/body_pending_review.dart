import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/complete_data/manager/controller/complete_data_controller.dart';

import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/routes/routes.dart';

class PendingReviewBody extends GetView<CompleteDataController> {
  const PendingReviewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
        ),
        Align(
            alignment: Alignment.center,
            child: Image.asset(AppImages.pindingreview)),
        const SizedBox(
          height: 20,
        ),
        Text(
          AppStrings.pending.tr,
          style: AppStyles.semibold24(context)
              .copyWith(color: const Color(0xff020202)),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            AppStrings
                .yourdocumentsarecurrentlyunderreviewWewillgetbacktoyouassoonaspossible
                .tr,
            style: AppStyles.semibold14(context),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomButton(
              onButtonPressed: () async {
                await controller.getData();
                UserService.to.currentUser.value?.data?.completeDataStatus =
                    controller.completeDataModel.data?.documentStatus;
                UserService.to.setUser(UserService.to.currentUser.value!);
                Get.toNamed(Routes.home);
                if (UserService
                        .to.currentUser.value?.data?.completeDataStatus ==
                    "rejected") {
                  Get.offAllNamed(Routes.completedata, arguments: 
                    {"isEdit": true}
                  );
                } else {
                  Get.offAllNamed(Routes.home);
                }
              },
              buttonText: AppStrings.startnow.tr),
        )
      ],
    );
  }
}
