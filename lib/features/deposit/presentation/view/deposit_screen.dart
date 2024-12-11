import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';

import 'package:horsely_app/features/deposit/presentation/view/widget/body_depost.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(titel: AppStrings.deposit.tr, context: context),
      body: const BodyDeposit(),
    );
  }
}
