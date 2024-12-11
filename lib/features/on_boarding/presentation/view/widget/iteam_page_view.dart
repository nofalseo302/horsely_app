import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/on_boarding/entity/page_view_iteam_entity.dart';

class IteamPageView extends StatelessWidget {
  const IteamPageView({super.key, required this.pageViewIteamEntity});
  final PageViewIteamEntity pageViewIteamEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * .35,
                  child: Image.asset(pageViewIteamEntity.image))),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: pageViewIteamEntity.titel,
                    style: AppStyles.semibold24(context)
                        .copyWith(color: const Color(0xffd4D221E))),
                TextSpan(
                    text: pageViewIteamEntity.diferrenttitel,
                    style: AppStyles.semibold24(context)
                        .copyWith(color: AppColors.primaryColor)),
                TextSpan(
                    text: pageViewIteamEntity.complettitel,
                    style: AppStyles.semibold24(context)
                        .copyWith(color: const Color(0xffd4d221e))),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            pageViewIteamEntity.subtitel,
            style: AppStyles.semibold16(context)
                .copyWith(color: const Color(0xff545454)),
          ),
        ],
      ),
    );
  }
}
