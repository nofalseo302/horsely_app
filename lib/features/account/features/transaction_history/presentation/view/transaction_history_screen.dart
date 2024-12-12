import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

import 'package:horsely_app/core/widget/build_app_bar.dart';
<<<<<<<< HEAD:lib/features/transactions/transaction_history/presentation/view/transaction_history_screen.dart
import 'package:horsely_app/features/transactions/transaction_history/presentation/view/widget/body_transaction_history.dart';
========
import 'package:horsely_app/features/account/features/transaction_history/presentation/widget/body_transaction_history.dart';
>>>>>>>> origin/Ali:lib/features/account/features/transaction_history/presentation/view/transaction_history_screen.dart

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
          titel: AppStrings.transactionhistory.tr, context: context),
      // ignore: prefer_const_constructors
      body: BodyTransactionHistoryScreen(),
    );
  }
}
