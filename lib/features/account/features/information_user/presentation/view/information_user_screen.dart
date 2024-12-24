import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/account/features/information_user/presentation/controler/image_controller.dart';

import 'package:horsely_app/features/account/features/information_user/presentation/view/widget/body_information.dart';

class InformationUserScreen extends GetView<ImageController> {
  const InformationUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F5F7),
      appBar: buildAppBar(titel: AppStrings.accountseting.tr, context: context),
      body: BodyInformationUser(),
    );
  }
}
