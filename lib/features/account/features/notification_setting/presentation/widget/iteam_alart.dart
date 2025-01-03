import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/account/features/notification_setting/presentation/widget/iteam_swatich_buttom.dart';

class ItamAlart extends StatelessWidget {
  const ItamAlart({
    super.key,
    required this.titel,
  });
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titel,
          style: AppStyles.semibold14(context),
        ),
        const Spacer(),
        const ReadReceiptToggle()
      ],
    );
  }
}
