import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/features/account/presentation/manager/controller/account_controler.dart';
import 'package:horsely_app/features/account/presentation/view/widget/body_account.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundScaffold,
      body: BodyAccount(),
    );
  }
}
