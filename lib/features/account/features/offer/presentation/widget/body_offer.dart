import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/features/account/features/offer/logic/controller/offers_controller.dart';
import 'package:horsely_app/features/account/features/offer/presentation/widget/iteam_offer.dart';

class BodyOffer extends GetView<OffersController> {
  const BodyOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const CustomLoader()
          : Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.5),
                              blurRadius: 4,
                              spreadRadius: -3)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${AppStrings.totaloffer.tr}(14)",
                            style: AppStyles.semibold18(context),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 14,
                              itemBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: IteamOffer(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
