import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';
import 'package:horsely_app/features/home/presentation/view/widget/header_iteam_bay.dart';
import 'package:horsely_app/features/home/presentation/view/widget/information_iteam_buy.dart';
import 'package:horsely_app/features/home/presentation/view/widget/list_tile_iteam_buy.dart';

class IteamBuy extends StatelessWidget {
  const IteamBuy({
    super.key,
    required this.isbay,
    required this.itemData,
    required this.nameButttom,
    this.onTap,
  });
  final bool isbay;
  final P2pItem itemData;
  final String nameButttom;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: .5,
            color: Colors.black.withOpacity(.15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 3,
                spreadRadius: -1)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          children: [
            HeaderIteamBuy(
              isbuy: isbay,
              item:itemData,
              namebuttom: nameButttom,
              onTap: onTap,
            ),
            const SizedBox(
              height: 16,
            ),
            Divider(
              color: const Color(0xffD9D9D9).withOpacity(.5),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTileIteamHome(
              dataItem: itemData,
            ),
            const SizedBox(
              height: 20,
            ),
            Infromation(
           
              p2pItem: itemData,
             
            )
          ],
        ),
      ),
    );
  }
}
