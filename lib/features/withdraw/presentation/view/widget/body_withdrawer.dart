import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
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
      child: Form(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: AppColors.backGroundScaffold,
                width: double.infinity,
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TitleAndWidget(
                      title: AppStrings.nameofcard.tr,
                      childWidget: CustomTextFormField(
                        textInputType: TextInputType.name,
                        hintText: "",
                        validator: (p0) =>
                            AppValidationFunctions.stringValidationFunction(
                                p0, AppStrings.nameofcard.tr),
                        // تأكد من نوع الإدخال
                      ),
                    ),
                    const SizedBox(height: 16),
                    TitleAndWidget(
                      title: AppStrings.bankname.tr,
                      childWidget: CustomTextFormField(
                        validator: (p0) =>
                            AppValidationFunctions.stringValidationFunction(
                                p0, AppStrings.bankname.tr),
                        hintText: "",
                        textInputType:
                            TextInputType.text, // تأكد من نوع الإدخال
                      ),
                    ),
                    const SizedBox(height: 16),
                    TitleAndWidget(
                      title: AppStrings.accountnumber.tr,
                      childWidget: CustomNumericTextFormField(
                        hintText: "",
                        validator: (p0) =>
                            AppValidationFunctions.numberValidationFunction(
                                p0, AppStrings.accountnumber.tr),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TitleAndWidget(
                      title: AppStrings.ibannamber.tr,
                      childWidget: CustomTextFormField(
                        textInputType: TextInputType.text,
                        hintText: "",
                        validator: (p0) =>
                            AppValidationFunctions.ibanValidationFunction(
                          p0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TitleAndWidget(
                      title: AppStrings.bankcode.tr,
                      childWidget: CustomTextFormField(
                        textInputType: TextInputType.text,
                        validator: (p0) =>
                            AppValidationFunctions.stringValidationFunction(
                                p0, AppStrings.bankcode.tr),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
