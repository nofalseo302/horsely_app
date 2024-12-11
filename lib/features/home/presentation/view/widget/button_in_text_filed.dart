import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ButtonInTextFiled extends StatelessWidget {
  const ButtonInTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: const Border(left: BorderSide(color: Color(0xffD9D9D9))),
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            Text(
              "USDT",
              style: AppStyles.semibold14(context),
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_down))
          ],
        ),
      ),
    );
  }
}
