import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class IteamEstimatedBalnce extends StatelessWidget {
  const IteamEstimatedBalnce({
    super.key,
    this.onTap,
    required this.image,
    required this.titel,
  });
  final void Function()? onTap;
  final String image, titel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: const Color(0xffFFFFFF).withOpacity(.1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                titel,
                style:
                    AppStyles.semibold14(context).copyWith(color: Colors.white),
              ),
              Image.asset(image)
            ],
          ),
        ),
      ),
    );
  }
}
