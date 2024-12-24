import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/account/features/transaction/presentation/widget/body_tranaction.dart';

class TransactionBuyerScreen extends StatelessWidget {
  const TransactionBuyerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: buildAppBar(titel: AppStrings.transaction.tr, context: context),
      body: const BodyTransaction(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          onButtonPressed: () {},
          buttonText: AppStrings.publish.tr,
        ),
      ),
    );
  }
}
