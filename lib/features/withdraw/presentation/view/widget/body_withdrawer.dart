import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_namber_text_filed.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';

class BodyWithdraw extends StatelessWidget {
  const BodyWithdraw({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // إضافة SingleChildScrollView
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              TitleAndWidget(
                title: AppStrings.nameofcard.tr,
                childWidget: const CustomNumericTextFormField(
                  hintText: "",
                  // تأكد من نوع الإدخال
                ),
              ),
              const SizedBox(height: 16),
              TitleAndWidget(
                title: AppStrings.bankname.tr,
                childWidget: const CustomTextFormField(
                  hintText: "",
                  textInputType: TextInputType.text, // تأكد من نوع الإدخال
                ),
              ),
              const SizedBox(height: 16),
              TitleAndWidget(
                title: AppStrings.accountnumber.tr,
                childWidget: const CustomNumericTextFormField(
                  hintText: "",
                ),
              ),
              const SizedBox(height: 16),
              TitleAndWidget(
                title: AppStrings.ibannamber.tr,
                childWidget: const CustomNumericTextFormField(
                  hintText: "",
                ),
              ),
              const SizedBox(height: 16),
              TitleAndWidget(
                title: AppStrings.bankcode.tr,
                childWidget: const CustomNumericTextFormField(
                  hintText: "",
                ),
              ),
              const SizedBox(height: 20), // المسافة بين المحتوى والزر
              CustomButton(
                onButtonPressed: () {},
                buttonText: AppStrings.confrim.tr,
              ),
              const SizedBox(height: 20), // المسافة السفلية
            ],
          ),
        ),
      ),
    );
  }
}
