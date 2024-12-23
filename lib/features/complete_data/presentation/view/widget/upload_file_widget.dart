import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/complete_data/manager/controller/complete_data_controller.dart';

class AddFile extends StatelessWidget {
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
    final CompleteDataController fileController =
        Get.put(CompleteDataController());

    return GestureDetector(
      onTap: () async {
        await fileController.pickFile();
        if (fileController.hasSelectedFile && onFileSelected != null) {
          onFileSelected!(fileController.selectedFile.value!);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DottedBorder(
              dashPattern: const [8, 4],
              color: showError && !fileController.hasSelectedFile
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
                            text: "Drop here to attach or",
                            style: AppStyles.semibold14(context)
                                .copyWith(color: const Color(0xff4B5563)),
                          ),
                          TextSpan(
                            text: " upload",
                            style: AppStyles.semibold14(context)
                                .copyWith(color: const Color(0xff2563EB)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Max file size: 5MB",
                      style: AppStyles.semibold12(context)
                          .copyWith(color: const Color(0xff4B5563)),
                    ),
                  ],
                ),
              ),
            ),
            if (showError && !fileController.hasSelectedFile)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "يرجى اختيار ملف.",
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
