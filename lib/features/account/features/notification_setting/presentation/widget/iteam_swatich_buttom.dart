import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';

class ReadReceiptToggle extends StatefulWidget {
  const ReadReceiptToggle({super.key});

  @override
  _ReadReceiptToggleState createState() => _ReadReceiptToggleState();
}

class _ReadReceiptToggleState extends State<ReadReceiptToggle> {
  bool isReadReceiptsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
      ).copyWith(
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(outline: AppColors.backGray)),
      child: Switch(
        activeColor: AppColors.primaryColor,
        activeTrackColor: AppColors.primaryColor,
        inactiveTrackColor: AppColors.backGray,
        inactiveThumbColor: AppColors.white,
        thumbColor: const WidgetStatePropertyAll<Color>(AppColors.white),
        value: isReadReceiptsEnabled,
        onChanged: (value) {
          setState(() {
            isReadReceiptsEnabled = value; // تغيير حالة الزر
          });
        },
      ),
    );
  }
}
