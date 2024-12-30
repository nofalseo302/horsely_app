import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/account/domain/entity/account_entity.dart';
import 'package:horsely_app/features/account/features/pincode/presentation/widget/change_pin_bottom_sheet.dart';
import 'package:horsely_app/features/account/features/pincode/presentation/widget/iteam_pin-code.dart';

class CreatPinCode extends StatelessWidget {
  const CreatPinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        IteamPincode(
          accountEntity: AccountEntity(
              image: AppImages.exchange,
              onPressed: () {
                Get.bottomSheet(const MyButtomSheet());
              },
              titel: "${AppStrings.createpincode.tr}   "),
        ),
      ],
    );
  }
}
