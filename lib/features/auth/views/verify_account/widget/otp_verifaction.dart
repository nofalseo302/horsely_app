// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:horsely_app/core/utils/app_colors.dart';

class OtpVerifaction extends StatelessWidget {
  const OtpVerifaction({
    super.key,
    required this.onSubmit,
    required this.onChange,
  });
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      defaultPinTheme: PinTheme(
        width: 75,
        height: 75,
        textStyle: TextStyle(
          fontSize: 20,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFEAEFF3)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 75,
        height: 75,
        textStyle: TextStyle(
          fontSize: 20,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onChanged: onChange,
      validator: (s) {
        // return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => onSubmit!(pin),
    );
  }
}
