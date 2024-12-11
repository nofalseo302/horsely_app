import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/bay_details/presentation/view/widget/seller_info.dart';
import 'package:horsely_app/features/home/presentation/view/widget/information_iteam_buy.dart';

class OfferDetails extends StatelessWidget {
  const OfferDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundScaffold,
      appBar: buildAppBar(titel: "BTC", context: context),
      body: const BodyOfferDetails(),
    );
  }
}

class BodyOfferDetails extends StatelessWidget {
  const BodyOfferDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const SellerInformation(),
          const SizedBox(
            height: 8,
          ),
          Infromation(
            titel: AppStrings.paymethod.tr,
            vule: '',
          ),
          const Spacer(),
          CustomButton(
              onButtonPressed: () {}, buttonText: AppStrings.accept.tr),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onButtonPressed: () {},
            buttonText: AppStrings.reject.tr,
            backgroundColor: const Color(0xFFD20000).withOpacity(.05),
            textColor: Colors.red,
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
