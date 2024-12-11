import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class CustomNumericTextFormField extends StatelessWidget {
  const CustomNumericTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
  });

  final String hintText;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: TextInputType.number, // نوع لوحة المفاتيح للأرقام
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly
      ], // السماح بالأرقام فقط
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: AppStyles.semibold14(context).copyWith(
          color: Colors.grey,
        ),
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey.shade300,
      ),
    );
  }
}
