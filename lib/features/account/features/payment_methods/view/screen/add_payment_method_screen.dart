import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/account/features/payment_methods/logic/controller/add_payment_method_controller.dart';

class AddPaymentMethodScreen extends GetView<AddPaymentMethodController> {
  const AddPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: buildAppBar(
            titel: AppStrings.addPaymentMethod.tr, context: context),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(controller.paymentMethodsModel!.value!.data!
                    .firstWhere((element) =>
                        element.id.toString() == Get.arguments.toString().tr)
                    .fields![index]
                    .title!),
                const SizedBox(height: 10),
                TextField(
                  controller: controller.paymentMethodsAnwers[index],
                  onChanged: (value) {
                    controller.paymentMethodsAnwers[index].text = value;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: controller.paymentMethodsModel!.value!.data!
            .firstWhere(
                (element) => element.id.toString() == Get.arguments.toString())
            .fields!
            .length,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
        buttonText  : AppStrings.save.tr,
          onButtonPressed: () {
            controller.savePayment();
          },
        ),
      ),
    );
  }
}
