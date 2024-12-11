import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_namber_text_filed.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/deposit/presentation/view/widget/cvv_filed.dart';
import 'package:horsely_app/features/deposit/presentation/view/widget/visa_expired_date_filed.dart';

class BodyDeposit extends StatelessWidget {
  const BodyDeposit({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
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
            childWidget: const CustomNumericTextFormField(
              hintText: "",
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
                  childWidget: const CVVField(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), // المسافة بين المحتوى والزر
          const Spacer(), // استخدام Spacer لدفع الزر للأسفل
          CustomButton(
            onButtonPressed: () {},
            buttonText: AppStrings.confrim.tr,
          ),
          const SizedBox(height: 20), // المسافة السفلية
        ],
      ),
    );
  }
}
