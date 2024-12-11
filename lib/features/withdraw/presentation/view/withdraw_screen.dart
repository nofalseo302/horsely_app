import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';

import 'package:horsely_app/features/withdraw/presentation/view/widget/body_withdrawer.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(titel: AppStrings.withdraw.tr, context: context),
      body: const BodyWithdraw(),
    );
  }
}
