import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/account/features/payment_methods/view/widget/add_payment_bottom_sheet.dart';
import 'package:horsely_app/features/home/logic/controler/payment_controller.dart';

class PaymentMethodScreen extends GetView<PaymentController> {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: buildAppBar(titel: AppStrings.paymethod.tr, context: context),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const CustomLoader()
            : controller.allpaymodel.value.data == null
                ? RetryWidget(
                    onRetry: () async => await controller.getAllPayment(),
                  )
                : RefreshIndicator(
                    onRefresh: () async => await controller.getAllPayment(),
                    child: ListView.builder(
                      itemCount: controller.allpaymodel.value.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
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
                          trailing: SizedBox(
                            width: 100,
                            child: CustomButton(
                              buttonText: controller
                                      .allpaymodel.value.data![index].isDefault!
                                  ? AppStrings.defaultbtn.tr
                                  : AppStrings.setdefault.tr,
                              backgroundColor: controller
                                      .allpaymodel.value.data![index].isDefault!
                                  ? Colors.white
                                  : AppColors.primaryColor,
                              textColor: !controller
                                      .allpaymodel.value.data![index].isDefault!
                                  ? Colors.white
                                  : AppColors.primaryColor,
                              onButtonPressed: () {
                                controller.setDefault(
                                  paymentMethodId: controller
                                      .allpaymodel.value.data![index].id!,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      ),
      bottomNavigationBar: Obx(() => controller.allpaymodel.value == null
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                buttonText: AppStrings.addPaymentMethod.tr,
                onButtonPressed: () {
                  Get.bottomSheet(
                    const AddPaymentBottomSheet(),
                    isScrollControlled: true,
                  );
                },
              ),
            )),
    );
  }
}
