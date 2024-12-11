import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class TitelAndVule extends StatelessWidget {
  const TitelAndVule({
    super.key,
    required this.titel,
    required this.vule,
  });

  final String titel, vule;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween, // توزيع المسافة بين النصين
      crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر رأسياً
      children: [
        // Container لضمان عرض النقطتين في مكان واحد دائما
        Expanded(
          flex: 1, // تخصيص نسبة لعنوان "titel"
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              titel,
              style: AppStyles.semibold14(context)
                  .copyWith(color: const Color(0xff8A8A8A)),
            ),
          ),
        ),
        const SizedBox(width: 10), // مسافة صغيرة بين العنوان والقيمة
        Expanded(
          flex: 3, // تخصيص نسبة لقيمة "vule"
          child: Text(
            ":     $vule",
            style: AppStyles.semibold14(context),
          ),
        ),
      ],
    );
  }
}
