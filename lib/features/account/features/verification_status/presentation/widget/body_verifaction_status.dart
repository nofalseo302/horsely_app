import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_button.dart';

class BodyVerificationStatus extends StatelessWidget {
  const BodyVerificationStatus({super.key});

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
              children: [
                const SizedBox(
                  height: 60,
                ),
                Container(child: Image.asset("assets/png/time 1.png")),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppStrings.pending.tr,
                    style: AppStyles.semibold24(context),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  AppStrings.messagepinding.tr,
                  style: AppStyles.semibold14(context),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  onButtonPressed: () {},
                  buttonText: AppStrings.viewdoumention.tr,
                  backgroundColor: AppColors.backgray,
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
