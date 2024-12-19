import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';

class IteamTransaction extends StatelessWidget {
  const IteamTransaction({super.key, required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 4,
                  spreadRadius: -3)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xff8A8A8A).withOpacity(.1),
                child: ClipOval(
                  child: Image.asset(
                    AppImages.pitcont,
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                "BTC",
                style: AppStyles.semibold20(context),
              ),
              subtitle: Text(
                "Bitcoin",
                style: AppStyles.semibold16(context)
                    .copyWith(color: const Color(0xff8A8A8A)),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '\$892.',
                    style: AppStyles.semibold24(context)
                        .copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: '80',
                    style: AppStyles.semibold24(context)
                        .copyWith(color: const Color(0xff8A8A8A)),
                  ),
                ],
              ),
            ),
            Text("+12.03% ",
                style: AppStyles.semibold16(context).copyWith(
                  color: AppColors.primaryColor,
                )),
            Text(
              "Revenue for August 2024",
              style: AppStyles.regulare10(context)
                  .copyWith(color: const Color(0xff8A8A8A)),
            )
          ],
        ),
      ),
    );
  }
}
