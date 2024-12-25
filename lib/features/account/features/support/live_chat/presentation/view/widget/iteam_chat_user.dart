import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class IteamChatUser extends StatelessWidget {
  const IteamChatUser({
    super.key,
    required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .8,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8, right: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Horsley bot",
                      style: AppStyles.semibold12(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // النص مع maxLines
                    Text(
                        "Hey welcome to Seenapay support, your online assistant.Choose a store you need help with?",
                        style: AppStyles.semibold14(context)
                            .copyWith(color: Colors.white),
                        textDirection: TextDirection.rtl),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          "2:43PM ",
          style: AppStyles.semibold14(context)
              .copyWith(color: const Color(0xff8A8A8A)),
        )
      ],
    );
  }
}
