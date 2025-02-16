import 'package:flutter/material.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class ItamButtomSheet extends StatelessWidget {
  const ItamButtomSheet({
    super.key,
    required this.image,
    required this.titel,
    this.onPressed,
  });
  final String image, titel;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 4,
                  spreadRadius: -1),
            ]),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18.0, top: 9, right: 0, bottom: 9),
          child: Row(
            children: [
              Image.asset(image),
              const SizedBox(
                width: 24,
              ),
              Text(
                titel,
                style: AppStyles.semibold16(context),
              ),
              const Spacer(),
              getCurrentLanguage() == "ar"
                  ? const Icon(Icons.keyboard_arrow_left)
                  : const Icon(Icons.keyboard_arrow_right),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
