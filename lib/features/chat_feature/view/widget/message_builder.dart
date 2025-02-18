import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/features/chat_feature/logic/controller/messages_controller.dart';
import 'package:horsely_app/features/chat_feature/view/widget/voiceMessage.dart';

class MessageBuilder extends GetView<MessagesController> {
  const MessageBuilder(
      {super.key, required this.isMe, required this.message, this.attach});
  final bool isMe;
  final String message;
  final String? attach;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: (Get.locale!.languageCode == 'ar' ? isMe : !isMe)
          ? Alignment.centerRight
          : Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: attach!.endsWith(".aac")
          // ? controller.playAudio("https://seda.codeella.com/" + attach!)
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment:
                  !isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  width: 300,
                  child: VoiceWidget(
                    isMine: isMe,
                    url: attach!,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      // horizontal: message.attach == null ? 20  : 5 ,
                      horizontal: 20,
                      vertical: 10),
                  constraints: BoxConstraints(
                    maxWidth: 0.7 * MediaQuery.of(context).size.width,
                  ),
                  decoration: BoxDecoration(
                    color: isMe ? AppColors.primaryColor : AppColors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: const Radius.circular(10),
                      bottomStart: const Radius.circular(10),
                      topEnd: isMe
                          ? const Radius.circular(10)
                          : const Radius.circular(0),
                      topStart: isMe
                          ? const Radius.circular(0)
                          : const Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        blurRadius: 5,
                        spreadRadius: -1,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      if (attach!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CustomImageHandler(
                              attach!,
                              height: 0.25 * Get.height,
                            ),
                          ),
                        )
                      else
                        const SizedBox(),
                      if (message.isNotEmpty)
                        Text(
                          message,
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: isMe ? AppColors.white : AppColors.black,
                          ),
                        ),
                    ],
                  ),
                ),
                // SizedBox(height: 5 ),
                // Text(
                //   DateFormat('h:mma d/M/yyyy').format(message.createdAt!),
                //   style: context.textTheme.labelSmall!.copyWith(
                //     color: AppColors.textInputBorderColor,
                //   ),
                // ),
              ],
            ),
    );
  }
}
