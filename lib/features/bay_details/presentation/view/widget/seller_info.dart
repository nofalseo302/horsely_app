import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';
import 'package:horsely_app/routes/routes.dart';

class SellerInformation extends StatelessWidget {
  const SellerInformation({super.key, required this.item});
  final P2pItem item;
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
            )
            // Badge(
            //   padding: const EdgeInsets.all(5),
            //   offset: const Offset(-2, -5),
            //   label: Text(
            //     "1",
            //     style:
            //         AppStyles.semibold12(context).copyWith(color: Colors.white),
            //   ),
            //   backgroundColor: AppColors.primaryColor,
            //   child: Container(
            //     padding: const EdgeInsets.all(10),
            //     width: 48,
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: const Color(0xff199800).withOpacity(.15)),
            //     child: const CustomImageHandler(AppImages.chats),
            //   ),
            // ),
            ),
      ),
    );
  }
}
