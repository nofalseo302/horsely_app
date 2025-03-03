import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/features/chat_feature/view/screen/chat_list_screen.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';

class ListTileIteamHome extends StatelessWidget {
  const ListTileIteamHome({super.key, required this.dataItem});
  final P2pItem dataItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // يوزع العناصر بين بداية ونهاية الـ Row
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // القسم الأيسر يحتوي على الصورة والعنوان والتفاصيل
          Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                // backgroundImage: const AssetImage("assets/png/company.png"),
                child: CustomImageHandler(
                  width: Get.width * 0.125,
                  dataItem.user?.image ??
                      "https://crepto.codeella.com/upload-test/payment-methods/bank_account.png",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 10), // مسافة بين الصورة والنص
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataItem.user?.name ?? "",
                    style: AppStyles.semibold16(context),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "${dataItem.user?.orderCount ?? 0} ${AppStrings.order.tr}   |",
                        style: AppStyles.semibold12(context)
                            .copyWith(color: const Color(0xff8A8A8A)),
                      ),
                      const SizedBox(width: 9),
                      Text(
                        "${dataItem.user?.completedOrderCount ?? 0} ${AppStrings.complete.tr}",
                        style: AppStyles.semibold12(context)
                            .copyWith(color: const Color(0xff8A8A8A)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // القسم الأيمن يحتوي على الوقت (trailing)
          Text(
            formatToMinutesAgo(dataItem.createdAtFormat ?? ""),
            style: AppStyles.semibold12(context)
                .copyWith(color: const Color(0xff8A8A8A)),
          ),
        ],
      ),
    );
  }
}
