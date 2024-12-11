import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/transaction_buyer/presentation/view/widget/body_transaction_buyer.dart';

class TransactionBuyerScreen extends StatelessWidget {
  const TransactionBuyerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundScaffold,
      appBar: buildAppBar(titel: AppStrings.transaction.tr, context: context),
      body: const BodyTransactionBuyer(),
    );
  }
}
