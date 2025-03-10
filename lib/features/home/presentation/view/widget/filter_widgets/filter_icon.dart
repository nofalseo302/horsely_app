import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/home/data/model/request_model/buy_request.dart';
import 'package:horsely_app/features/home/logic/controler/home_controller.dart';
import 'package:horsely_app/features/home/presentation/view/widget/buttom_filter.dart';

class FilterIcon extends GetView<HomeControler> {
  const FilterIcon({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.onSaved,
    required this.searchController,
    this.obscureText = false,
  });

  final String hintText;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 3,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                obscureText: obscureText,
                controller: searchController,
                onChanged: (p0) {
                  if (p0.isEmpty) {
                    controller.activeIndex.value == 0
                        ? controller.getSellData(
                            requestModel: HomeDataRequest(
                                search: controller.activeIndex.value == 0
                                    ? controller.buySearchController.text
                                    : controller.sellSearchController.text,
                                offerType: OfferType.buy,
                                paymentMethods: controller.selectedAllPayment,
                                currencyType: controller.selectedAllCurrency,
                                coinType: controller.selectedCoinTypes))
                        : controller.getBuyData(
                            requestModel: HomeDataRequest(
                                offerType: OfferType.sell,
                                paymentMethods: controller.selectedAllPayment,
                                currencyType: controller.selectedAllCurrency,
                                coinType: controller.selectedCoinTypes));
                  }
                },
                onFieldSubmitted: onSaved,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return;
                  }
                  return null;
                },
                keyboardType: textInputType,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  hintText: hintText,
                  hintStyle: AppStyles.semibold14(context).copyWith(
                    color: const Color(0xffB5B5B5).withOpacity(.7),
                  ),
                  border: InputBorder.none, // إزالة الحدود
                ),
              ),
            ),
            const ButtonInfilter()
          ],
        ),
      ),
    );
  }
}
