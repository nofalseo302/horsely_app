import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/bay_details/logic/controller/buy_details_controller.dart';
import 'package:horsely_app/features/bay_details/presentation/view/widget/information_about_transaction.dart';
import 'package:horsely_app/features/wallet/view/widget/header_buttom_sheet.dart';

class ConfirmBottomSheet extends GetView<OffersController> {
  const ConfirmBottomSheet(
      {super.key,
      required this.price,
      required this.tax,
      required this.totalAmount,
      required this.cur});
  final String price, tax, totalAmount, cur;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * .45,
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
              InformationAboutTranformation(
                price: price,
                tax: tax,
                cur: cur,
                totalAmount: totalAmount,
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          onButtonPressed: () async {
                            Get.back();
                            controller.creatOffer();
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

class StatusSheet extends StatelessWidget {
  const StatusSheet(
      {super.key, required this.success, required this.onRetry, this.message});
  final bool success;
  final String? message;
  final Function onRetry;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              success
                  ? Image.asset(AppImages.successTransaction)
                  : const CustomImageHandler(AppImages.remove),
              const SizedBox(
                height: 16,
              ),
              Text(
                success
                    ? AppStrings.confrimMess.tr
                    : message ??
                        AppStrings.somethingentwrongpleaseTryAgainLater.tr,
                textAlign: TextAlign.center,
                style: AppStyles.semibold24(context),
              ),
              const SizedBox(
                height: 16,
              ),
              success
                  ? CustomButton(
                      onButtonPressed: () async {
                        Get.back();
                      },
                      buttonText: AppStrings.ok.tr)
                  : Column(
                      children: [
                        CustomButton(
                            backgroundColor: AppColors.redColor,
                            onButtonPressed: () async {
                              onRetry();
                              Get.back();
                            },
                            buttonText: AppStrings.tryAgain.tr),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomButton(
                            backgroundColor: AppColors.backGray,
                            textColor: Colors.black,
                            onButtonPressed: () async {
                              Get.back();
                            },
                            buttonText: AppStrings.later.tr)
                      ],
                    ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
