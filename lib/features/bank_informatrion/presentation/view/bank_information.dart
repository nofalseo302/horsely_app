import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';

import 'package:horsely_app/features/bank_informatrion/presentation/view/widget/body_bank_information.dart';

class BankInformation extends StatelessWidget {
  const BankInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundScaffold,
      appBar: buildAppBar(titel: "Withdraw", context: context),
      body: const BodyBankInformation(),
    );
  }
}
