import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/account/features/notification_setting/presentation/widget/body_notifaction_seting.dart';

class NotifactionSetingScreen extends StatelessWidget {
  const NotifactionSetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundScaffold,
      appBar:
          buildAppBar(titel: AppStrings.notifactionseting.tr, context: context),
      body: const BodyNotifactionSetingScreen(),
    );
  }
}
