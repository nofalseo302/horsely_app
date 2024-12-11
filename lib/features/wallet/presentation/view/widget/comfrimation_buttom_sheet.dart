import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/home/presentation/view/widget/titel_and_vule.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/card_information.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/header_buttom_sheet.dart';

class ConfroationButtomSheet extends StatelessWidget {
  const ConfroationButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              HeaderButtomSheet(
                titel: AppStrings.sendmony.tr,
              ),
              Text(
                AppStrings.suretransfer.tr,
                style: AppStyles.semibold16(context)
                    .copyWith(color: const Color(0xff8A8A8A)),
              ),
              const SizedBox(
                height: 16,
              ),
              const CardInformation(),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.black.withOpacity(.1)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.25),
                          blurRadius: 3,
                          spreadRadius: -1)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitelAndVule(
                        titel: AppStrings.amount.tr,
                        vule: '3000 \$',
                      ),
                      TitelAndVule(
                        titel: AppStrings.pincode.tr,
                        vule: '2A283Q',
                      ),
                      TitelAndVule(
                        titel: AppStrings.tax.tr,
                        vule: '20\$',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  onButtonPressed: () {}, buttonText: AppStrings.confrim.tr),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                onButtonPressed: () {
                  Get.back();
                },
                buttonText: AppStrings.cancel.tr,
                borderColor: Colors.transparent,
                textColor: Colors.black,
                backgroundColor: const Color(0xffE9EFF5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
