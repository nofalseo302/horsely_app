import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';

class IteamChooseWallet extends StatelessWidget {
  const IteamChooseWallet({
    super.key,
    required this.name,
    required this.isActive,
    this.onTap,
    required this.image,
    required this.net,
  });
  final String name;
  final String? net;
  final bool isActive;
  final void Function()? onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
          trailing: CustomImageHandler(
              isActive ? AppImages.active : AppImages.notactive),
          title: Row(
            children: [
              Text(
                name,
                style: AppStyles.semibold18(context),
              ),
              Text(
                net ?? '',
                style: AppStyles.semibold18(context),
              ),
            ],
          ),
          leading: CircleAvatar(
            backgroundColor: AppColors.backGray,
            radius: 25,
            child: CustomImageHandler(image),
          )),
    );
  }
}
