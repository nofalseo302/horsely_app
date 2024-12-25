import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/comfrimation_buttom_sheet.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/header_buttom_sheet.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/iteam_buttom_sheet.dart';

class TransferbuttomSheet extends StatelessWidget {
  const TransferbuttomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const HeaderButtomSheet(
                titel: AppStrings.selectyouroption,
              ),
              const SizedBox(
                height: 30,
              ),
              ItamButtomSheet(
                onPressed: () {
                  // Close the first bottom sheet
                  Get.back();
                  // Open the confirmation bottom sheet
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Get.bottomSheet(const ConfroationButtomSheet());
                  });
                },
                image: AppImages.bankaccount,
                titel: AppStrings.bankaccount.tr,
              ),
              const SizedBox(
                height: 12,
              ),
              ItamButtomSheet(
                image: AppImages.banktransfer,
                titel: AppStrings.banktransfer.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
