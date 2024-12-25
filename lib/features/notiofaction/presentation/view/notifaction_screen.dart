import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/notiofaction/logic/controller/notifcations_controller.dart';
import 'package:horsely_app/features/notiofaction/presentation/view/widget/body_notifaction.dart';

class NotifactionScreen extends GetView<NotificationsController> {
  const NotifactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundScaffold,
      appBar: buildAppBar(titel: AppStrings.notifaction.tr, context: context),
      body: RefreshIndicator(
          onRefresh: () async {
            await controller.getAllNotification();
          },
          child: const BodyNotifaction()),
    );
  }
}
