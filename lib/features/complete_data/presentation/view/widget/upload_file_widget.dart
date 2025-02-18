import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/complete_data/manager/controller/complete_data_controller.dart';

class AddFile extends GetView<CompleteDataController> {
  final bool showError;
  final void Function(File)? onFileSelected;

  const AddFile({
    super.key,
    this.showError = false,
    this.onFileSelected,
  });

  @override
  Widget build(BuildContext context) {
    // استخدام Get.find بدلاً من Get.put

    return GestureDetector(
      onTap: () async {
        await controller.pickFile();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DottedBorder(
              dashPattern: const [8, 4],
              color: showError && !controller.hasSelectedFile
                  ? Colors.red
                  : const Color(0xffD2D5DA),
              strokeWidth: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 27.0, vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.upload),
                    const SizedBox(
                      height: 12,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.dropHeretoattachor.tr,
                            style: AppStyles.semibold14(context)
                                .copyWith(color: const Color(0xff4B5563)),
                          ),
                          TextSpan(
                            text: " ${AppStrings.upload.tr}",
                            style: AppStyles.semibold14(context)
                                .copyWith(color: const Color(0xff2563EB)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppStrings.maxFilesize5MB.tr,
                      style: AppStyles.semibold12(context)
                          .copyWith(color: const Color(0xff4B5563)),
                    ),
                  ],
                ),
              ),
            ),
            if (showError && !controller.hasSelectedFile)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  AppStrings.pleaseSelectafile.tr,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
