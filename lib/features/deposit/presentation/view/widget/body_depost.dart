import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/widget/custom_namber_text_filed.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/deposit/presentation/view/widget/cvv_filed.dart';
import 'package:horsely_app/features/deposit/presentation/view/widget/visa_expired_date_filed.dart';

class BodyDeposit extends StatelessWidget {
  const BodyDeposit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 8,
            color: AppColors.backgray,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 20),
                TitleAndWidget(
                  title: AppStrings.cardholdername.tr,
                  childWidget: const CustomTextFormField(
                    hintText: "",
                    textInputType: TextInputType.name,
                  ),
                ),
                const SizedBox(height: 16),
                TitleAndWidget(
                  title: AppStrings.cardnumber.tr,
                  childWidget: CustomNumericTextFormField(
                    hintText: "",
                    validator: (p0) =>
                        AppValidationFunctions.cardNumberValidationFunction(p0),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TitleAndWidget(
                        title: AppStrings.expirydate.tr,
                        childWidget: const VisaExpiryDateField(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TitleAndWidget(
                        title: AppStrings.cvv.tr,
                        childWidget: CVVField(
                          validator: (p0) =>
                              AppValidationFunctions.cvvValidationFunction(p0),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // المسافة بين المحتوى والزر
                // استخدام Spacer لدفع الزر للأسفل
                // المسافة السفلية
              ],
            ),
          ),
        ],
      ),
    );
  }
}
