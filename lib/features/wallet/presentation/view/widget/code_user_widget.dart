import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/wallet/presentation/view/manager/controler/code_Controler.dart';

class EncryptedTextRow extends StatelessWidget {
  const EncryptedTextRow({super.key});

  @override
  Widget build(BuildContext context) {
    // استخدام GetX لإيجاد Controller
    final TextController controller = Get.put(TextController());

    return Row(
      children: [
        Row(
          children: [
            GetBuilder<TextController>(
              builder: (_) => Text(
                controller.isObscured ? '••••••••' : controller.data,
                style: AppStyles.semibold14(context).copyWith(
                    color: AppColors.primaryColor), // عرض النص مشفر أو مرئي
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
        IconButton(
          icon: GetBuilder<TextController>(
            builder: (_) => Icon(
              controller.isObscured
                  ? Icons.visibility_off
                  : Icons.visibility, // تبديل الأيقونة
            ),
          ),
          onPressed: () {
            controller.toggleVisibility(); // تبديل حالة إخفاء/إظهار النص
          },
        ),
      ],
    );
  }
}
