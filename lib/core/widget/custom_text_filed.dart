import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.textInputType,
      this.suffixIcon,
      this.onSaved,
      this.inputFormatters,
      this.controller,
      this.title,
      this.spacing,
      this.maxLines = 1,
      this.obscureText = false,
      this.validator});
  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final String? title;
  final double? spacing;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int maxLines;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing ?? 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    title!,
                    style: AppStyles.semibold16(context),
                  ),
                ),
          TextFormField(
            inputFormatters: inputFormatters ?? [],
            obscuringCharacter: "*",
            controller: controller,
            obscureText: obscureText,
            onChanged: onSaved,
            validator: validator,
            keyboardType: textInputType,
            maxLines: maxLines,
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
          ),
        ],
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
