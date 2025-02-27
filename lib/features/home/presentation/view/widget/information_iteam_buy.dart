import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';
import 'package:horsely_app/features/home/presentation/view/widget/buy_widgets/iteam_buy_way.dart';
import 'package:horsely_app/features/home/presentation/view/widget/titel_and_vule.dart';

import '../../../../../core/utils/app_text_styles.dart';

class Infromation extends StatelessWidget {
  const Infromation(
      {super.key,
      // required this.titel,
      // required this.vule,
      required this.p2pItem});
  // final String titel, vule;
  final P2pItem p2pItem;
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
                vule:
                    " ${p2pItem.price ?? ""} ${p2pItem.currency?.symbol ?? ""} "),
            const SizedBox(
              height: 12,
            ),
            TitelAndVule(
              titel: AppStrings.available.tr,
              vule: " ${p2pItem.avaliableAmount ?? ""} " ?? "",
            ),
            const SizedBox(
              height: 12,
            ),
            TitelAndVule(
              titel: AppStrings.orderlimit.tr,
              vule: '\$${p2pItem.minLimit}-\$${p2pItem.maxLimit}',
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
                  Wrap(
                      direction: Axis.horizontal,
                      children: (p2pItem.paymentMethod ?? [])
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: IteamPayWay(title: e.name.toString()),
                              ))
                          .toList())
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
