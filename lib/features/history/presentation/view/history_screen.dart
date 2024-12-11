import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/history/presentation/view/body_history.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(titel: AppStrings.history.tr, context: context),
      body: BodyHistory(),
    );
  }
}
