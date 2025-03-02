import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/account/features/offer/data/model/offers_model/datum.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';
import 'package:horsely_app/features/home/presentation/view/widget/buy_widgets/iteam_buy_way.dart';
import 'package:horsely_app/features/home/presentation/view/widget/titel_and_vule.dart';

class InfoOffer extends StatelessWidget {
  const InfoOffer(
      {super.key,
      // required this.titel,
      // required this.vule,
      required this.p2pItem});
  // final String titel, vule;
  final OfferModel p2pItem;
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
              titel: AppStrings.amount.tr,
              vule: " ${p2pItem.price ?? ""} ${p2pItem.currency?.symbol ?? ""}",
            ),
            const SizedBox(
              height: 12,
            ),
            TitelAndVule(
              titel: AppStrings.wants.tr,
              vule:
                  " ${p2pItem.amount ?? ""} ${p2pItem.cryptoCurrency?.symbol ?? ""}",
            ),
            const SizedBox(
              height: 12,
            ),
            FittedBox(
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "${AppStrings.paymethod.tr}     ",
                      style: AppStyles.semibold14(context)
                          .copyWith(color: const Color(0xff8A8A8A)),
                    ),
                  ),
                  IteamPayWay(title: p2pItem.paymentMethod ?? ""),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
