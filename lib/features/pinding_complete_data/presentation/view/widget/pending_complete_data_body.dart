import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/core/widget/custom_button.dart';

class BendingCompletDataBody extends StatelessWidget {
  const BendingCompletDataBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .25,
        ),
        Align(
            alignment: Alignment.center,
            child: Image.asset(AppImages.pindingcompletdata)),
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
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            AppStrings.messagepinding.tr,
            style: AppStyles.semibold14(context),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomButton(
              onButtonPressed: () {
                Get.offAllNamed(Routes.completedata, arguments: {
                  'isEdit': false,
                });
              },
              buttonText: AppStrings.completMydoumention.tr),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomButton(
            onButtonPressed: () {
              Get.offAllNamed(Routes.home);
            },
            buttonText: AppStrings.startnow.tr,
            borderColor: Colors.transparent,
            backgroundColor: AppColors.backgray,
            textColor: Colors.black,
          ),
        )
      ],
    );
  }
}
