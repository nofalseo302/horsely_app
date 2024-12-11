import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/live_chat/presentation/view/widget/body_live_chat.dart';

class LiveChatsScreen extends StatelessWidget {
  const LiveChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(titel: AppStrings.livechat.tr, context: context),
        body: BodyLiveChat());
  }
}
