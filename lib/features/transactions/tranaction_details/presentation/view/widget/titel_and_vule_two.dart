import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class TitelAndVuleTwo extends StatelessWidget {
  const TitelAndVuleTwo({
    super.key,
    required this.titel,
    required this.vule,
    required this.secondValue,
    required this.fristVule,
  });

  final String titel, vule, secondValue, fristVule;

  Color _getColorForValue(String value) {
    switch (value) {
      case '1':
        return Colors.black; // اللون الأسود للقيمة 1
      case '2':
        return Colors.red; // اللون الأحمر للقيمة 2
      case '3':
      case '4':
        return Colors.green; // اللون الأخضر للقيم 3 و 4
      default:
        return Colors.black; // اللون الافتراضي
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              titel,
              style: AppStyles.semibold16(context)
                  .copyWith(color: const Color(0xff8A8A8A)),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: ":  $fristVule ", // القيمة الأولى
                  style: AppStyles.semibold16(context)
                      .copyWith(color: _getColorForValue(vule)),
                ),
                TextSpan(
                  text: secondValue, // القيمة الثانية
                  style: AppStyles.semibold12(context).copyWith(
                    color: const Color(
                        0xff8A8A8A), // استخدام الدالة للحصول على اللون
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
