import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/routes/routes.dart';

class SellerInformation extends StatelessWidget {
  const SellerInformation({
    super.key,
  });

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
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/png/company.png"),
          radius: 25,
        ),
        title: FittedBox(
          child: Row(
            children: [
              Text(
                "waseela_21912",
                style: AppStyles.semibold16(context),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                "(4.6)",
                style: AppStyles.semibold12(context)
                    .copyWith(color: const Color(0xff8A8A8A)),
              ),
              const Icon(
                Icons.star,
                color: Colors.yellow,
              )
            ],
          ),
        ),
        subtitle: Text(
          "219 ${AppStrings.order.tr} |  198 ${AppStrings.complete.tr}",
          style: AppStyles.semibold12(context)
              .copyWith(color: const Color(0xff8A8A8A)),
        ),
        trailing: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.chat, arguments: {'userId': 4});
          },
          child: Badge(
            padding: const EdgeInsets.all(5),
            offset: const Offset(-2, -5),
            label: Text(
              "1",
              style:
                  AppStyles.semibold12(context).copyWith(color: Colors.white),
            ),
            backgroundColor: AppColors.primaryColor,
            child: Container(
              padding: const EdgeInsets.all(10),
              width: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff199800).withOpacity(.15)),
              child: const CustomImageHandler(AppImages.chats),
            ),
          ),
        ),
      ),
    );
  }
}
