import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class IteamButtomSheetInfo extends StatelessWidget {
  const IteamButtomSheetInfo({
    super.key,
    required this.titel,
    required this.vule,
    this.istax = false,
  });
  final String titel, vule;
  final bool istax;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titel,
          style: AppStyles.semibold14(context),
        ),
        const Spacer(),
        Text(
          vule,
          style: AppStyles.semibold14(context)
              .copyWith(color: istax ? Colors.red : Colors.black),
        ),
      ],
    );
  }
}
