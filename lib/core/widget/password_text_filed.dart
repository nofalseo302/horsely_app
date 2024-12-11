import 'package:flutter/material.dart';
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
        }
        return null;
      },
      controller: widget.controller,
      obscureText: obscureText,
      onSaved: widget.onSaved,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? const Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              )
            : const Icon(
                Icons.visibility_off,
                color: Color(0xffC9CECF),
              ),
      ),
      hintText: "",
      textInputType: TextInputType.visiblePassword,
    );
  }
}
