import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/account/domain/entity/account_entity.dart';

class IteamAccount extends StatelessWidget {
  const IteamAccount({super.key, required this.accountEntity});

  final AccountEntity accountEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: accountEntity.onPressed,
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
            padding: const EdgeInsets.only(left: 20.0),
            child: CircleAvatar(
                backgroundColor: AppColors.backgray,
                child: SvgPicture.asset(accountEntity.image)),
          ),
          title: Text(
            accountEntity.titel,
            style: AppStyles.semibold16(context),
          ),
          trailing: IconButton(
              onPressed: accountEntity.onPressed,
              icon: getCurrentLanguage() == "ar"
                  ? const Icon(Icons.keyboard_arrow_left)
                  : const Icon(Icons.keyboard_arrow_right)),
        ),
      ),
    );
  }
}
