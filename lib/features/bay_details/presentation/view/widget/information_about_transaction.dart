import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/bay_details/presentation/view/widget/iteam_buttom_sheet_info.dart';

class InformationAboutTranformation extends StatelessWidget {
  const InformationAboutTranformation({
    super.key,
    required this.price,
    required this.tax,
    required this.totalAmount,
    required this.cur,
  });
  final String price, tax, totalAmount, cur;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: const Color(0xffF2F6F9)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            IteamButtomSheetInfo(
              titel: AppStrings.purchaseprice.tr,
              vule: '$price $cur ',
            ),
            const SizedBox(
              height: 6,
            ),
            IteamButtomSheetInfo(
              titel: AppStrings.tax.tr,
              vule: '$tax $cur ',
              istax: true,
            ),
            const SizedBox(
              height: 8,
            ),
            IteamButtomSheetInfo(
              titel: AppStrings.totalamount.tr,
              vule: '$price $cur ',
            ),
          ],
        ),
      ),
    );
  }
}
