import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/transactions/transaction/presentation/view/widget/body_tranaction.dart';

class TeanactionScreen extends StatelessWidget {
  const TeanactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(titel: AppStrings.transaction.tr, context: context),
      body: const BodyTransaction(),
    );
  }
}
