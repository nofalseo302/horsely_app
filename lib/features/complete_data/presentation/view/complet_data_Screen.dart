import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/complete_data/presentation/view/widget/body_complete_data.dart';

class CompletDataScreen extends StatelessWidget {
  const CompletDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundScaffold,
      appBar: buildAppBar(titel: AppStrings.compeltedata.tr, context: context),
      body: const BodyCompletData(),
    );
  }
}
