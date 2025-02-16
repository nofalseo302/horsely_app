import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/exensions.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';

class FristWalletScreen extends StatelessWidget {
  const FristWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGray,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            SizedBox(
              height: 20.h,
            ),
            IteamFristWallet(
              onTap: () {},
            ),
            SizedBox(
              height: 8.h,
            ),
            IteamFristWallet(
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class IteamFristWallet extends StatelessWidget {
  const IteamFristWallet({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 3,
                spreadRadius: -4),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0xffE9EFF5).withOpacity(.9),
            radius: 25,
            child: CustomImageHandler(AppImages.pitcont),
          ),
          title: Text(
            "BTC",
            style: AppStyles.semibold20(context),
          ),
          subtitle: Text(
            "Ethereum",
            style: AppStyles.semibold14(context)
                .copyWith(color: Color(0xff8A8A8A)),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
