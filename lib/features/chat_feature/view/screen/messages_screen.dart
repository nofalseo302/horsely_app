
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/chat_feature/logic/controller/messages_controller.dart';
import 'package:horsely_app/features/chat_feature/view/widget/chat_input.dart';
import 'package:horsely_app/features/chat_feature/view/widget/message_builder.dart';

class MessagesScreen extends GetView<MessagesController> {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: GetBuilder<MessagesController>(
          // init: controller,
          builder: (controller) => controller.isLoading.value ||
                  controller.chatModel.value == null
              ? const SizedBox()
              : AppBar(
                  backgroundColor: AppColors.white,
                  leading: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  title: Row(
                    children: [
                      const ClipOval(
                        child: CustomImageHandler(
                          
                          "controller.chatModel.value?.data?.chatData?.driver?.image" ??
                              "",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                       " controller.chatModel.value?.data?.chatData?.driver?.name "??
                            "",
                        style: AppStyles.regulare16(context),
                      ),
                    ],
                  ),
                  actions: controller.chatModel.value?.data?.chatData
                              ?.unreadMessagesCustomer ??
                          false
                      ? null
                      : [
                          // GestureDetector(
                          //   onTap: () {
                          //     AppFunctions.launchDialer(
                          //         AppFunctions.launchDialer(
                          //       (controller.chatModel.value?.data?.chatData
                          //                   ?.driver?.mobileCountryCode ??
                          //               "") +
                          //           (controller.chatModel.value?.data?.chatData
                          //                   ?.driver?.mobile ??
                          //               ""),
                          //     ));
                          //   },
                          //   child: Container(
                          //     decoration: BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       color:
                          //           const Color(0xff0035A7).withOpacity(0.10),
                          //     ),
                          //     padding: const EdgeInsets.all(9),
                          //     child: const CustomImageHandler(
                          //       AppImages.call,
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(width: 10),
                        ],
                ),
        ),
      ),
      body: GetBuilder<MessagesController>(
        builder: (c) => controller.isLoading.value
            ? const CustomLoader()
            : controller.chatModel.value == null
                ? RetryWidget(
                    onRetry: () async => await controller.getChatData())
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: controller.scrollController,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => MessageBuilder(
                            isMe: UserService.to.currentUser!.value?.data?.id ==
                                (controller.chatModel.value!.data!.messages!
                                        .data![index].userId ??
                                    0),
                            message: controller.chatModel.value?.data?.messages
                                    ?.data?[index].message ??
                                "",
                            attach: controller.chatModel.value?.data?.messages
                                    ?.data?[index].attach ??
                                "",
                          ),
                          itemCount: controller.chatModel.value?.data?.messages
                                  ?.data?.length ??
                              0,
                        ),
                      ),
                      // if (controller.chatModel.value?.data?.chatData
                      //         ?.canSendMessages ??
                      //     false)
                        const ConversationInput()
                      // // else
                      // //   Center(
                      // //     child: Padding(
                      // //       padding: const EdgeInsets.symmetric(vertical: 20),
                      // //       child: Text(
                      // //         AppStrings.chatIsView.tr,
                      // //         style: CustomTextTheme.textTheme.bodyMedium!
                      // //             .copyWith(
                      // //           color: AppColors.primaryColor,
                      // //         ),
                      // //       ),
                      // //     ),
                      //   )
                    ],
                  ),
      ),
      // bottomNavigationBar: ConversationInput(),
    );
  }
}
