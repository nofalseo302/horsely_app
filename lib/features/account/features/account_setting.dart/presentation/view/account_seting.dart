import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';

import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/account/features/account_setting.dart/presentation/view/widget/body_account_seting.dart';

class AccountSeting extends StatelessWidget {
  const AccountSeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGray,
      appBar: buildAppBar(titel: AppStrings.accountseting.tr, context: context),
      // ignore: prefer_const_constructors
      body: BodyAccountSetting(),
    );
  }
}
