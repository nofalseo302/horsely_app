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
    this.controller,
    this.validator,
  });
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onSaved,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,

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
        focusedBorder: buildBorder(Colors.grey.shade900),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color? borderColor]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        width: 1,
        color: borderColor ?? Colors.grey.shade400,
      ),
    );
  }
}
