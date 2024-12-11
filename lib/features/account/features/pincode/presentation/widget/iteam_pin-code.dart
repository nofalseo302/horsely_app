import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/account/domain/entity/account_entity.dart';

class IteamPincode extends StatelessWidget {
  const IteamPincode(
      {super.key, required this.accountEntity, this.rest = false});

  final AccountEntity accountEntity;
  final bool rest;
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
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
                backgroundColor: rest ? Color(0xffFBE8E8) : AppColors.backgray,
                child: SvgPicture.asset(accountEntity.image)),
          ),
          title: Text(
            accountEntity.titel,
            style: AppStyles.semibold16(context)
                .copyWith(color: rest ? Colors.red : Colors.black),
          ),
        ),
      ),
    );
  }
}
