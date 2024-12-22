import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
    this.controller,
  });

  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: (p0) {
        if (p0 == null || p0.isEmpty) {
          return "Please enter your password";
        } else {
          return AppValidationFunctions.passwordValidationFunction(p0);
        }
     
      },
      controller: widget.controller,
      obscureText: obscureText,
      onSaved: widget.onSaved,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: Image.asset(!obscureText ? AppImages.eye : AppImages.eyeDisable),
      ),
      hintText: "",
      textInputType: TextInputType.visiblePassword,
    );
  }
}
