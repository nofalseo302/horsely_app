import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/tranaction_details/presentation/view/widget/titel_and_vule_two.dart';

class HeaderTransactionDetails extends StatelessWidget {
  const HeaderTransactionDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                spreadRadius: -3)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage(AppImages.pitcont),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "BTC",
                            style: AppStyles.semibold20(context),
                          ),
                          Text(
                            "Bitcoin",
                            style: AppStyles.semibold16(context)
                                .copyWith(color: const Color(0xff8A8A8A)),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 7,
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
                          style: AppStyles.semibold16(context)
                              .copyWith(color: const Color(0xff8A8A8A)),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "+12.03% ",
                    style: AppStyles.semibold16(context)
                        .copyWith(color: Colors.green),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  TitelAndVuleTwo(
                    titel: AppStrings.higherprice.tr,
                    vule: '1',
                    secondValue: '.10',
                    fristVule: '\$910',
                  ),
                  TitelAndVuleTwo(
                    titel: AppStrings.lowprice.tr,
                    vule: '2',
                    secondValue: '52',
                    fristVule: '\$870.',
                  ),
                  TitelAndVuleTwo(
                    titel: AppStrings.netfit.tr,
                    vule: '3',
                    secondValue: '.10',
                    fristVule: '\$110',
                  ),
                  TitelAndVuleTwo(
                    titel: '${AppStrings.profit.tr} (%)',
                    vule: '3',
                    secondValue: '',
                    fristVule: '6.32%',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
