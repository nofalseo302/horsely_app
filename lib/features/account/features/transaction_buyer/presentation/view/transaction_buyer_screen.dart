import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
<<<<<<<< HEAD:lib/features/transactions/transaction_buyer/presentation/view/transaction_buyer_screen.dart
import 'package:horsely_app/features/transactions/transaction_buyer/presentation/view/widget/body_transaction_buyer.dart';
========
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/account/features/transaction_buyer/presentation/view/widget/body_transaction_buyer.dart';
>>>>>>>> origin/Ali:lib/features/account/features/transaction_buyer/presentation/view/transaction_buyer_screen.dart

class TransactionBuyerScreen extends StatelessWidget {
  const TransactionBuyerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: buildAppBar(titel: AppStrings.transaction.tr, context: context),
      body: const BodyTransactionBuyer(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: CustomButton(
          onButtonPressed: () {},
          buttonText: AppStrings.publish.tr,
        ),
      ),
    );
  }
}
