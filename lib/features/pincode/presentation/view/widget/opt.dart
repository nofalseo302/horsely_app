import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:horsely_app/core/utils/app_colors.dart';

class Opt extends StatelessWidget {
  const Opt({
    super.key,
    required this.onSubmit,
  });
  final void Function(String)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      autoFocus: true,
      fieldHeight: 61,
      fieldWidth: 52,
      focusedBorderColor: AppColors.primaryColor, // اللون عند التركيز
      borderColor: Colors.black, // اللون الأساسي للحدود
      showFieldAsBox: true,
      borderWidth: 1, // سمك الحدود
      borderRadius: BorderRadius.circular(16), // نصف قطر الحدود
      enabledBorderColor: Colors.black, // لون الحدود للحقول غير النشطة
      // عند تغيير الرمز
      onCodeChanged: (String code) {},
      // عند إدخال جميع الحقول
      onSubmit: onSubmit, // نهاية onSubmit
    );
  }
}
