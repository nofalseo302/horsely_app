import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';

import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/accout_seting.dart/presentation/view/widget/body_account_seting.dart';

class AccountSeting extends StatelessWidget {
  const AccountSeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgray,
      appBar: buildAppBar(titel: AppStrings.accountseting.tr, context: context),
      // ignore: prefer_const_constructors
      body: BodyAccountSetting(),
    );
  }
}
