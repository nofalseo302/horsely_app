import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.isactive,
  });
  final bool isactive;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: isactive ? Get.width * .1 : Get.width * .05,
      decoration: BoxDecoration(
          color: isactive ? AppColors.primaryColor : const Color(0xffD3D3D3),
          borderRadius: BorderRadius.circular(24)),
    );
  }
}
