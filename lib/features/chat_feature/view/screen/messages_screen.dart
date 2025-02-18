import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SafeArea(
          child: GetBuilder<MessagesController>(
            builder: (c) => controller.isLoading.value
                ? const CustomLoader()
                : controller.chatModel.value == null
                    ? Center(
                        child: RetryWidget(
                            onRetry: () async =>
                                await controller.getChatData()),
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              const CustomBackButton(),
                              const Spacer(),
                              Text(
                                controller.chatModel.value?.data?.chatData?.user
                                        ?.name ??
                                    "",
                                style: AppStyles.semibold20(context),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              CircleAvatar(
                                backgroundColor: AppColors.backGray,
                                child: CustomImageHandler(
                                  controller.chatModel.value?.data?.chatData
                                          ?.user?.image ??
                                      "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              controller: controller.scrollController,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return MessageBuilder(
                                  isMe: (UserService
                                          .to.currentUser.value?.data?.id ==
                                      (controller.chatModel.value!.data!
                                              .messages!.data![index].userId ??
                                          0)),
                                  message: controller.chatModel.value?.data
                                          ?.messages?.data?[index].message ??
                                      "",
                                  attach: controller.chatModel.value?.data
                                          ?.messages?.data?[index].attach ??
                                      "",
                                );
                              },
                              itemCount: controller.chatModel.value?.data
                                      ?.messages?.data?.length ??
                                  0,
                            ),
                          ),
                          const ConversationInput()
                        ],
                      ),

          ),
        ),
      ),
      // bottomNavigationBar: ConversationInput(),
    );
  }
}
