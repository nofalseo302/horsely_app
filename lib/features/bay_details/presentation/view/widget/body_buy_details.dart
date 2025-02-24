import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_namber_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/bay_details/presentation/view/widget/comfrim_buttom_sheet.dart';
import 'package:horsely_app/features/bay_details/presentation/view/widget/seller_info.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';
import 'package:horsely_app/features/home/presentation/view/widget/drop_dawn.dart';
import 'package:horsely_app/features/home/presentation/view/widget/information_iteam_buy.dart';

class BodyBuyDetailsScreen extends StatelessWidget {
  const BodyBuyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const SellerInformation(),
            const SizedBox(
              height: 8,
            ),
            Infromation(
            p2pItem: P2pItem(),
            ),
            const SizedBox(
              height: 20,
            ),
            TitleAndWidget(
                title: AppStrings.enteramount.tr,
                childWidget: const CustomNumericTextFormField(
                  hintText: "",
                )),
            const SizedBox(
              height: 16,
            ),
            TitleAndWidget(
                title: AppStrings.theamountofcurency.tr,
                childWidget: const CustomNumericTextFormField(
                  hintText: "",
                )),
            const SizedBox(
              height: 16,
            ),
            TitleAndWidget(
                title: AppStrings.paymentseected.tr,
                childWidget: CustomAnimatedDropdown(
                  items: const ["InstaPay", "Vodafone Cash"],
                  titiel: AppStrings.chooseway.tr,
                )),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                onButtonPressed: () {
                  Get.bottomSheet(const ComfrimButtomSheet());
                },
                buttonText: AppStrings.buy.tr),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
