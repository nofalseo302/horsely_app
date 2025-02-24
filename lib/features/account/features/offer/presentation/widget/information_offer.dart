import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/home/presentation/view/widget/buy_widgets/iteam_buy_way.dart';
import 'package:horsely_app/features/home/presentation/view/widget/titel_and_vule.dart';
import 'package:horsely_app/features/account/features/offer_details.dart/presentation/view/offer_details.dart';

import '../../../../../../core/utils/app_text_styles.dart';

class InformationOffer extends StatelessWidget {
  const InformationOffer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: .5,
            color: Colors.black.withOpacity(.15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 3,
                spreadRadius: -1)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            TitelAndVule(
              titel: AppStrings.lowprice.tr,
              vule: '\$910.10',
            ),
            const SizedBox(
              height: 12,
            ),
            TitelAndVule(
              titel: AppStrings.higherprice.tr,
              vule: '\$870.52',
            ),
            const SizedBox(
              height: 12,
            ),
            TitelAndVule(
              titel: '${AppStrings.profit.tr} (%)',
              vule: '6.32%',
            ),
            const SizedBox(
              height: 12,
            ),
            FittedBox(
              child: Row(
                children: [
                  Text(
                    "${AppStrings.paymethod.tr}   :       ",
                    style: AppStyles.semibold14(context)
                        .copyWith(color: const Color(0xff8A8A8A)),
                  ),
                  const IteamPayWay(
                    title: "",
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const IteamPayWay(title: " "),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                onButtonPressed: () {
                  Get.to(() => const OfferDetails());
                },
                buttonText: AppStrings.viewdetails.tr),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
