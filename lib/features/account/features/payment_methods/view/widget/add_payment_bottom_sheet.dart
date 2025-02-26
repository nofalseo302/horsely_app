import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/features/home/logic/controler/payment_controller.dart';
import 'package:horsely_app/routes/routes.dart';

class AddPaymentBottomSheet extends GetView<PaymentController> {
  const AddPaymentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Text(
                    AppStrings.choosePaymentMethod.tr,
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                      // controller.amountController.clear();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.allpaymodel.value.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.02),
                          offset: const Offset(0, 0),
                          blurRadius: 8,
                          spreadRadius: -1,
                        )
                      ]),
                  child: ListTile(
                    onTap: () {
                      Get.back();
                      Get.toNamed(
                        Routes.addPaymentMethod,
                        arguments: controller.allpaymodel.value.data![index].id,
                      );
                    },
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    leading: ClipOval(
                      child: CustomImageHandler(
                        width: 48,
                        height: 48,
                        controller.allpaymodel.value.data![index].image!,
                      ),
                    ),
                    title: Text(
                      controller.allpaymodel.value.data![index].name!,
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
