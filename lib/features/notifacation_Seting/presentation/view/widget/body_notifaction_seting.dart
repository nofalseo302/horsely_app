import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/notifacation_Seting/presentation/view/widget/iteam_alart.dart';

class BodyNotifactionSetingScreen extends StatelessWidget {
  const BodyNotifactionSetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Expanded(
            child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                spreadRadius: -3),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppStrings.pushnotifaction.tr,
                  style: AppStyles.semibold16(context),
                ),
                const SizedBox(
                  height: 40,
                ),
                ItamAlart(
                  titel: AppStrings.pricealerts.tr,
                ),
                const SizedBox(
                  height: 32,
                ),
                ItamAlart(
                  titel: AppStrings.accountupdate.tr,
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
