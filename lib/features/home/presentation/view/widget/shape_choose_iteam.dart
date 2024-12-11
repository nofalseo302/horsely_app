import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class ShapeChoose extends StatelessWidget {
  const ShapeChoose({super.key, required this.titel});
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Row(
          children: [
            Text(
              titel,
              style:
                  AppStyles.semibold12(context).copyWith(color: Colors.white),
            ),
            const SizedBox(width: 8),
            const Icon(size: 20, Icons.close, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
