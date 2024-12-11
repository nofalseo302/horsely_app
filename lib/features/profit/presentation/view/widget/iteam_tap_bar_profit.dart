import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class ItamTapBarProfit extends StatelessWidget {
  const ItamTapBarProfit({
    super.key,
    required this.nameiteam,
    required this.isactive,
    this.onTap,
  });
  final bool isactive;
  final String nameiteam;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isactive ? AppColors.primaryColor : AppColors.backgray,
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 1,
                  spreadRadius: 0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Text(
            nameiteam,
            style: AppStyles.semibold14(context)
                .copyWith(color: isactive ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
