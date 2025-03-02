import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/account/features/offer/data/model/offers_model/datum.dart';

import 'package:horsely_app/features/account/features/offer/presentation/widget/information_offer.dart';
import 'package:horsely_app/routes/routes.dart';

class IteamOffer extends StatelessWidget {
  const IteamOffer({super.key, required this.offerModel});
  final OfferModel offerModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(.1)),
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 4,
                  spreadRadius: -3)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(offerModel.user?.image ?? ""),
                  radius: 25,
                ),
                title: Row(
                  children: [
                    Text(
                      offerModel.user?.name ?? "",
                      style: AppStyles.semibold16(context),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    offerModel.user?.rating == null
                        ? const Text("")
                        : Text(
                            offerModel.user?.rating.toString() ?? "",
                            style: AppStyles.semibold12(context)
                                .copyWith(color: const Color(0xff8A8A8A)),
                          ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  ],
                ),
                subtitle: Text(
                  "${offerModel.user?.orderCount} ${AppStrings.order.tr} |  ${offerModel.user?.completedOrderCount} ${AppStrings.complete.tr}",
                  style: AppStyles.semibold12(context)
                      .copyWith(color: const Color(0xff8A8A8A)),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.chat,
                        arguments: {'userId': offerModel.user?.id});
                  },
                  child: Badge(
                    isLabelVisible: offerModel.messageCount != null,
                    padding: const EdgeInsets.all(5),
                    offset: const Offset(-2, -5),
                    label: Text(offerModel.messageCount ?? '',
                        style: AppStyles.semibold12(context)
                            .copyWith(color: Colors.white)),
                    backgroundColor: AppColors.primaryColor,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff199800).withOpacity(.15)),
                      child: Image.asset(AppImages.chatNotifications),
                    ),
                  ),
                ),
              ),
              InformationOffer(offer: offerModel),
            ],
          ),
        ),
      ),
    );
  }
}
