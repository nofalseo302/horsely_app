import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/offer/presentation/view/widget/body_offer.dart';

class OfferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundScaffold,
      appBar: buildAppBar(titel: "BTC", context: context),
      body: BodyOffer(),
    );
  }
}
