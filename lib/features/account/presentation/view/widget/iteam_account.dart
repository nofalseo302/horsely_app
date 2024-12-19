import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_image.dart';
import 'package:horsely_app/features/account/domain/entity/account_entity.dart';

class IteamAccount extends StatelessWidget {
  const IteamAccount({
    super.key,
    required this.accountEntity,
    this.trailing,
    this.textColor,
  });

  final AccountEntity accountEntity;
  final Widget? trailing;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: accountEntity.onPressed,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0, top: 8),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                spreadRadius: -1)
          ]),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0),
              child: CircleAvatar(
                backgroundColor: AppColors.backgray,
                child: CustomImage(path: accountEntity.image),
              ),
            ),
            title: Text(
              accountEntity.titel,
              style: AppStyles.semibold16(context).copyWith(
                color: textColor ?? Colors.black,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                trailing ?? Container(),
                IconButton(
                  onPressed: accountEntity.onPressed,
                  icon: getCurrentLanguage() == "ar"
                      ? const Icon(Icons.keyboard_arrow_left)
                      : const Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
