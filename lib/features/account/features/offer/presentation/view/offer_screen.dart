import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/account/features/offer/logic/controller/offers_controller.dart';
import 'package:horsely_app/features/account/features/offer/presentation/widget/body_offer.dart';

class OfferScreen extends GetView<OffersController> {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundScaffold,
      appBar: buildAppBar(titel: (controller.title), context: context),
      body: const BodyOffer(),
    );
  }
}
