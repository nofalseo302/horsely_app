import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class TitleAndWidget extends StatelessWidget {
  const TitleAndWidget({
    super.key,
    required this.title,
    required this.childWidget,
  });

  final String title;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.semibold16(context),
        ),
        const SizedBox(
          height: 16,
        ),
        childWidget,
      ],
    );
  }
}
