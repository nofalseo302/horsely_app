import 'package:flutter/material.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/home/presentation/view/widget/button_in_text_filed.dart';

class CustomTextFieldWithButton extends StatelessWidget {
  const CustomTextFieldWithButton({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.onSaved,
    this.obscureText = false,
  });

  final String hintText;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 3,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                obscureText: obscureText,
                onChanged: onSaved,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.viladtion;
                  }
                  return null;
                },
                keyboardType: textInputType,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppStyles.semibold14(context).copyWith(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none, // إزالة الحدود
                ),
              ),
            ),
            const ButtonInTextFiled()
          ],
        ),
      ),
    );
  }
}
