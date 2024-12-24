import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/home/presentation/view/widget/rating_widget.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomRatingBar(),
        const SizedBox(height: 9),
        Text(
          "& Up",
          style: AppStyles.semibold16(context),
        ),
        const Spacer(),
        Radio(value: false, groupValue: const [], onChanged: (s) {}),
      ],
    );
  }
}
