import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/features/complete_data/manager/controller/complete_data_controller.dart';

class ShapeFileupload extends GetView<CompleteDataController> {
  const ShapeFileupload({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Obx(() {
        return controller.hasSelectedFile
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.selectedFile.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DottedBorder(
                    radius: const Radius.circular(12),
                    dashPattern: const [8, 4],
                    color: const Color(0xff707070),
                    strokeWidth: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: double.infinity,
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff17875C).withOpacity(.05),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomImageHandler(
                              AppImages.file,
                            ),
                          ),
                        ),
                        title: Text(
                          controller.selectedFile[index]!.path!
                              .split('/')
                              .last, // اسم الملف
                          style: AppStyles.semibold14(context)
                              .copyWith(color: const Color(0xff6C7176)),
                        ),
                        subtitle: Text(
                          controller.selectedFile[index]!.path!.contains('http')
                              ? ""
                              : "${(File(controller.selectedFile[index]!.path!).lengthSync() / 1024).toStringAsFixed(2)} KB",
                          style: AppStyles.regulare10(context)
                              .copyWith(color: const Color(0xff6C7176)),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            if (controller.selectedFile[index]!.path!
                                .contains('http')) {
                              controller.deleteImage(
                                id: controller.selectedFile[index]!.id
                                    .toString(),
                              );
                            } else {
                              controller.removeFile(index);
                            }
                          },
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(); // إخفاء الودجت إذا لم يتم اختيار ملف
      }),
    );
  }
}
