import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/account/features/offer/data/model/offers_model/datum.dart';
import 'package:horsely_app/features/home/presentation/view/widget/buy_widgets/iteam_buy_way.dart';
import 'package:horsely_app/features/home/presentation/view/widget/titel_and_vule.dart';
import 'package:horsely_app/features/account/features/offer_details.dart/presentation/view/screen/offer_details.dart';

import '../../../../../../core/utils/app_text_styles.dart';

class InformationOffer extends StatelessWidget {
  const InformationOffer({
    super.key,
    required this.offer,
  });
  final OfferModel offer;
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
              titel: AppStrings.price.tr,
              vule: '${offer.currency?.symbol ?? ""} ${offer.price ?? ""}',
            ),
            const SizedBox(
              height: 12,
            ),
            TitelAndVule(
              titel: AppStrings.wants.tr,
              vule:
                  '${offer.amount ?? ""} ${offer.cryptoCurrency?.symbol ?? ""}',
            ),
            const SizedBox(
              height: 12,
            ),
            if (offer.status != null && offer.status != "draft")
              TitelAndVule(
                titel: AppStrings.status.tr,
                vule: '${offer.status ?? ""}',
              ),
            SizedBox(
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
                  IteamPayWay(
                    title: offer.paymentMethod ?? '',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                onButtonPressed: () {
                  Get.to(() => OfferDetails(
                        offer: offer,
                      ));
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
