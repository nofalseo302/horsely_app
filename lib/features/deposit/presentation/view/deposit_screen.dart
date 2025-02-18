import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';

import 'package:horsely_app/features/deposit/presentation/view/widget/body_depost.dart';

import '../../../../core/widget/custom_button.dart';

class DepositScreen extends StatelessWidget {
  const DepositScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGray,
      appBar: buildAppBar(titel: AppStrings.deposit.tr, context: context),
      body: const BodyDeposit(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: CustomButton(
          onButtonPressed: () {},
          buttonText: AppStrings.confrim.tr,
        ),
      ),
    );
  }
}
