import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/bay_details/presentation/view/widget/iteam_buttom_sheet_info.dart';

class InformationAboutTranformation extends StatelessWidget {
  const InformationAboutTranformation({
    super.key,
  });

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
              vule: '123.08 AED',
            ),
            const SizedBox(
              height: 6,
            ),
            IteamButtomSheetInfo(
              titel: AppStrings.taxnamber.tr,
              vule: '10 AED',
              istax: true,
            ),
            const SizedBox(
              height: 8,
            ),
            IteamButtomSheetInfo(
              titel: AppStrings.totalamount.tr,
              vule: '150 AED',
            ),
          ],
        ),
      ),
    );
  }
}
