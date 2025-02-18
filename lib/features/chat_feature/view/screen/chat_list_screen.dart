// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/chat_feature/logic/controller/chat_list_controller.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:intl/intl.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ChatListController>(
        builder: (controller) {
          return controller.getAllChatsLoading
              ? CustomLoader()
              : controller.usersListModel == null
                  ? RetryWidget(
                      onRetry: () async => await controller.getAllChats(),
                    )
                  : Column(
                      children: [
                        SizedBox(height: 0.1 * Get.height),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackButton(),
                              Text(
                                AppStrings.messages.tr,
                                style: AppStyles.semibold18(context),
                              ),
                              SizedBox(
                                width: 40,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        (controller.usersListModel?.data?.data ?? []).isEmpty
                            ? Padding(
                                padding: EdgeInsets.only(top: Get.height * 0.3),
                                child: Text(AppStrings.noChats.tr))
                            : Expanded(
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  controller: controller.scrollController,
                                  itemCount: controller
                                          .usersListModel?.data?.data?.length ??
                                      0,
                                  separatorBuilder: (context, index) => Divider(
                                    color: Color(0xffd9d9d9).withOpacity(0.3),
                                  ),
                                  itemBuilder: (context, index) {
                                    var data = controller
                                        .usersListModel?.data?.data?[index];
                                    return ListTile(
                                      onTap: () {
                                        controller.setCurrentUserIndex(index);
                                        Get.toNamed(Routes.chat, arguments: {
                                          'userId': data!.orderId,
                                        });
                                      },
                                      leading: ClipOval(
                                        child: CustomImageHandler(
                                          data?.driver?.image,
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(
                                        data?.driver?.name.toString() ?? "",
                                        style: AppStyles.semibold20(context),
                                      ),
                                      subtitle: Text(
                                        data?.lastMessage?.message ?? "",
                                        style: AppStyles.regulare16(context),
                                      ),
                                      trailing: Text(
                                        data?.lastMessage?.createdAt == null
                                            ? ""
                                            : formatToMinutesAgo(
                                                data?.lastMessage?.createdAt ??
                                                    ""),
                                        style: AppStyles.regulare16(context)
                                            .copyWith(
                                                color: index % 2 == 0
                                                    ? AppColors.black
                                                    : AppColors.gray),
                                      ),
                                    );
                                  },
                                ),
                              )
                      ],
                    );
        },
      ),
    );
  }
}

String formatToMinutesAgo(String isoTimestamp) {
  final dateTime = DateTime.parse(isoTimestamp); // Parse the ISO timestamp
  final now = DateTime.now(); // Get the current time
  final difference = now.difference(dateTime); // Calculate the time difference

  if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} days';
  } else {
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
