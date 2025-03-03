import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/features/account/features/offer/data/model/offers_model/datum.dart';
import 'package:horsely_app/routes/routes.dart';

class Selinfo extends StatelessWidget {
  const Selinfo({super.key, required this.item});
  final OfferModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black.withOpacity(.15), width: .5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 3,
              spreadRadius: -1,
            ),
          ]),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(item.user?.image ?? ""),
        ),
        title: Row(
          children: [
            Text(
              item.user?.name ?? "",
              style: AppStyles.semibold16(context),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "(4.6)", //Todo :missed from api
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
          "${item.user?.orderCount} ${AppStrings.order.tr} |  ${item.user?.completedOrderCount} ${AppStrings.complete.tr}",
          style: AppStyles.semibold12(context)
              .copyWith(color: const Color(0xff8A8A8A)),
        ),
        trailing: GestureDetector(
            onTap: () {
              Get.toNamed(Routes.chat, arguments: {'userId': item.user?.id});
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff199800).withOpacity(.15)),
              child: const CustomImageHandler(AppImages.chatNotifications),
            )),
      ),
    );
  }
}
