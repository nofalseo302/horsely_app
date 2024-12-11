import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onButtonPressed,
    required this.buttonText,
    this.icon, // يمكن أن تكون أيقونة أو مسار صورة
    this.backgroundColor, // لون الزر كمعامل اختياري
    this.textColor, // لون النص كمعامل اختياري
    this.borderColor, // لون الإطار كمعامل اختياري
  });

  final VoidCallback onButtonPressed;
  final String buttonText;
  final dynamic icon; // يمكن أن تكون أيقونة (IconData) أو مسار صورة (String)
  final Color? backgroundColor; // يمكن تخصيص لون الزر
  final Color? textColor; // يمكن تخصيص لون النص
  final Color? borderColor; // يمكن تخصيص لون الإطار

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17),
            side: BorderSide(
              color: borderColor ?? Colors.transparent, // لون الإطار
            ),
          ),
          backgroundColor:
              backgroundColor ?? AppColors.primaryColor, // لون الزر الافتراضي
        ),
        onPressed: onButtonPressed,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى
            children: [
              Center(
                child: FittedBox(
                  child: Text(
                    buttonText,
                    style: AppStyles.semibold16(context).copyWith(
                      color: textColor ?? Colors.white, // لون النص الافتراضي
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              if (icon != null) // إذا كانت الأيقونة أو الصورة موجودة، أضفها
                Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0), // مسافة بين الأيقونة/الصورة والنص
                  child: icon is IconData
                      ? Icon(
                          icon as IconData,
                          color: Colors.white, // لون الأيقونة
                        )
                      : Image.asset(
                          icon as String,
                          color: Colors.white, // لون الصورة
                        ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
