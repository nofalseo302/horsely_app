import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/home/presentation/view/widget/buttom_filter.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({
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
                    return;
                  }
                  return null;
                },
                keyboardType: textInputType,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: AppStyles.semibold14(context).copyWith(
                    color: const Color(0xffB5B5B5).withOpacity(.7),
                  ),
                  border: InputBorder.none, // إزالة الحدود
                ),
              ),
            ),
            const ButtonInfilter()
          ],
        ),
      ),
    );
  }
}
