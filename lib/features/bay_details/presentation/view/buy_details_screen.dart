import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

import 'package:horsely_app/core/widget/build_app_bar.dart';

import 'package:horsely_app/features/bay_details/presentation/view/widget/body_buy_details.dart';

class BuyDetailsScreen extends StatelessWidget {
  const BuyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(titel: "${AppStrings.buy.tr} BTC", context: context),
      // ignore: prefer_const_constructors
      body: BodyBuyDetailsScreen(),
    );
  }
}
