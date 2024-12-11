import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

import 'package:horsely_app/core/widget/build_app_bar.dart';

import 'package:horsely_app/features/sell_details/presentation/view/widget/body_sell_details.dart';

class SellDetailsScreen extends StatelessWidget {
  const SellDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(titel: "${AppStrings.sell.tr} BTC", context: context),
      body: const BodySellDetails(),
    );
  }
}
