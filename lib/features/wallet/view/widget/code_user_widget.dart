import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/wallet/logic/controller/code_Controler.dart';

class EncryptedTextRow extends GetView<WalletDataController> {
  const EncryptedTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<WalletDataController>(
              builder: (_) => Container(
                alignment: Alignment.center,
                height: 50,
                width: Get.width * 0.6,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    controller.isObscured
                        ? '•••••••••••••••••••••••••••••••••••••'
                        : controller.walletModel.data?[0].privateKey ?? "",
                    style: AppStyles.semibold14(context).copyWith(
                        color: AppColors.primaryColor), // عرض النص مشفر أو مرئي
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.copy,
                color: AppColors.primaryColor,
              ),
              onPressed: () {
                controller.copyText(); // نسخ النص عند الضغط على أيقونة النسخ
              },
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(onTap: () {
          controller.toggleVisibility(); // تبديل حالة إخفاء/إظهار النص
        }, child: GetBuilder<WalletDataController>(builder: (controller) {
          return Image.asset(
              controller.isObscured ? AppImages.eye : AppImages.eyeDisable);
        })),
      ],
    );
  }
}
