import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/bay_details/presentation/view/widget/information_about_transaction.dart';
import 'package:horsely_app/features/wallet/view/widget/header_buttom_sheet.dart';

class ComfrimButtomSheet extends StatelessWidget {
  const ComfrimButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderButtomSheet(
                titel: AppStrings.transactiondetails.tr,
              ),
              const SizedBox(
                height: 16,
              ),
              const InformationAboutTranformation(),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          onButtonPressed: () {
                            Get.back();
                            Get.bottomSheet(Container(
                              height: MediaQuery.of(context).size.height * .4,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      topRight: Radius.circular(35))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Image.asset(AppImages.sucesstranaction),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    AppStrings.messagesucess.tr,
                                    style: AppStyles.semibold24(context),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: CustomButton(
                                        onButtonPressed: () {
                                          Get.back();
                                        },
                                        buttonText: AppStrings.ok.tr),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ));
                          },
                          buttonText: AppStrings.confrim.tr)),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: CustomButton(
                          backgroundColor: AppColors.backGray,
                          borderColor: Colors.transparent,
                          textColor: Colors.black,
                          onButtonPressed: () {
                            Get.back();
                          },
                          buttonText: AppStrings.cancel.tr)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
