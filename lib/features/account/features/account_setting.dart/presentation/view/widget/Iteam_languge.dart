import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';

class ItteamLanguage extends StatelessWidget {
  const ItteamLanguage({
    super.key,
    required this.isactive,
    required this.titel,
    this.onTap,
  });
  final String titel;
  final bool isactive;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titel,
          style: AppStyles.semibold14(context),
        ),
        const Spacer(),
        GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
                isactive ? AppImages.active : AppImages.notactive))
      ],
    );
  }
}
