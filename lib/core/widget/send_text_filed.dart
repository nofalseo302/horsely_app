import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class SendTextFiled extends StatelessWidget {
  const SendTextFiled(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon,
      this.onSaved,
      this.obscureText = false,
      required this.controller}); // أضف الـ controller هنا

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final TextEditingController controller; // تعريف الـ controller

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onSaved,
      controller: controller, // استخدام الـ controller هنا
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: AppStyles.semibold14(context).copyWith(
          color: Colors.grey,
        ),
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xFFF7F7F9),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey.shade300,
      ),
    );
  }
}
