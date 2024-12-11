import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon,
      this.onSaved,
      this.controller,
      this.obscureText = false,
      this.validator});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onSaved,
      validator: validator,
      keyboardType: textInputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
