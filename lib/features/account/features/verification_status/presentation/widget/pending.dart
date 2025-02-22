import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/account/features/verification_status/logic/controller/verification_status_controller.dart';
import 'package:horsely_app/routes/routes.dart';

class Pending extends GetView<VerificationStatusController> {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 4,
                    spreadRadius: -3),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: 60,
                // ),
                controller.userModel?.data?.completeDataStatus == 'rejected'
                    ? const Icon(
                        Icons.dangerous,
                        size: 120,
                        color: AppColors.redColor,
                      )
                    : Center(
                        child: Image.asset("assets/png/time 1.png"),
                      ),
                const SizedBox(
                  height: 20,
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    controller.userModel?.data?.completeDataStatus == 'rejected'
                        ? AppStrings.yourDataHasBeenRejected.tr
                        : AppStrings.pending.tr,
                    style: AppStyles.semibold24(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                controller.userModel?.data?.completeDataStatus == 'rejected'
                    ? const SizedBox()
                    : Text(
                        AppStrings.messagepinding.tr,
                        style: AppStyles.semibold14(context),
                      ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  onButtonPressed: () {
                    Get.toNamed(
                      Routes.completedata,
                      arguments: {
                        'isEdit': true,
                      },
                    );
                  },
                  buttonText: AppStrings.viewdoumention.tr,
                  backgroundColor: AppColors.backGray,
                  textColor: Colors.black,
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
