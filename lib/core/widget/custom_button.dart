import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onButtonPressed,
    required this.buttonText,
    this.enabled = true,
    this.icon, // يمكن أن تكون أيقونة أو مسار صورة
    this.backgroundColor, // لون الزر كمعامل اختياري
    this.textColor, // لون النص كمعامل اختياري
    this.borderColor, // لون الإطار كمعامل اختياري
  });

  final VoidCallback onButtonPressed;
  final String buttonText;
  final bool enabled;
  final dynamic icon; // يمكن أن تكون أيقونة (IconData) أو مسار صورة (String)
  final Color? backgroundColor; // يمكن تخصيص لون الزر
  final Color? textColor; // يمكن تخصيص لون النص
  final Color? borderColor; // يمكن تخصيص لون الإطار

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
            ),
          ),
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
        ),
        onPressed: enabled ? onButtonPressed : null,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
