import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import '../../../../../core/widget/password_text_filed.dart';

class BodyChangePassword extends StatelessWidget {
  const BodyChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 4,
            spreadRadius: -3)
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9),
        child: Form(
          child: Column(
            children: [
              TitleAndWidget(
                  title: AppStrings.curentpassword.tr,
                  childWidget: PasswordField()),
              const SizedBox(height: 16),
              TitleAndWidget(
                  title: AppStrings.newspassword.tr,
                  childWidget: PasswordField()),
              const SizedBox(height: 16),
              TitleAndWidget(
                  title: AppStrings.comfrimnewpassword.tr,
                  childWidget: const PasswordField()),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
