// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/features/account/features/account_setting.dart/presentation/manager/controler/languge_controler.dart';
import 'package:horsely_app/features/chat_feature/logic/controller/messages_controller.dart';

class ConversationInput extends GetView<MessagesController> {
  const ConversationInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      // height: 80.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => (controller.isRecording.value)
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor.withOpacity(0.10),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      controller.timerTime.value.toString(),
                      // controller
                      //     .formatSecondsToHHmm(controller.timerTime.value),
                      // "${(controller.timerTime.value ~/ 3600).toString().padLeft(2, '0')}:${((controller.timerTime.value % 3600) ~/ 60).toString().padLeft(2, '0')}",
                      style: AppStyles.regulare12(context)
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  )
                : controller.imageMessage.value.isNotEmpty
                    ? CustomImageHandler(
                        File(
                          controller.imageMessage.value,
                        ),
                        width: double.infinity,
                        height: 150,
                      )
                    : SizedBox(),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  await controller.pickMessageImage();
                },
                child: CustomImageHandler(AppImages.camera,
                    color: Color(0xff7D848D), width: 25),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 45,
                  child: TextFormField(
                    controller: controller.messageController,
                    style: context.textTheme.labelSmall!.copyWith(
                      color: AppColors.black,
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        controller.isEmptyMessage.value = true;
                      } else {
                        controller.isEmptyMessage.value = false;
                      }
                    },
                    textDirection: Get.find<LanguageController>()
                                .getCacheLanguage()
                                .languageCode ==
                            'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    decoration: InputDecoration(
                      fillColor: Color(0xffF7F7F9),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 24,
                        minHeight: 24,
                      ),
                      hintText: AppStrings.messages.tr,
                      hintStyle: context.textTheme.labelSmall!.copyWith(
                        color: Colors.grey,
                      ),
                      constraints: BoxConstraints(
                        maxHeight: 45,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => controller.isEmptyMessage.value ||
                        controller.imageMessage.value.isNotEmpty
                    ? controller.isSending.value
                        ? SizedBox(
                            width: Get.width * 0.05,
                            height: Get.width * 0.05,
                            child: CustomLoader())
                        : GestureDetector(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              controller.sendMessage();
                            },
                            child: RotatedBox(
                              quarterTurns:
                                  Get.locale!.languageCode == 'ar' ? 2 : 0,
                              child: CustomImageHandler(
                                AppImages.send,
                                color: Color(0xff7D848D),
                                width: 25,
                              ),
                            ),
                          )
                    : GestureDetector(
                        onTapDown: (details) {
                          controller.startRecording();
                        },
                        onTapUp: (details) {
                          controller.stopRecording();
                        },
                        child: Icon(
                          Icons.mic,
                          color: Color(0xff7D848D),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
