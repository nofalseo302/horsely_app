import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/features/profit/presentation/view/widget/body_profit.dart';

class ProfitSceen extends StatelessWidget {
  const ProfitSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.backGray,
      body: BodyProfit(),
    );
  }
}
