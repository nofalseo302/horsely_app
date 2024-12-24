import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/complete_data/manager/controller/complete_data_controller.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/complete_data/presentation/view/widget/shape_file-upload.dart';
import 'package:horsely_app/features/complete_data/presentation/view/widget/upload_file_widget.dart';

class BodyCompletData extends GetView<CompleteDataController> {
  const BodyCompletData({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.25),
                        blurRadius: 4,
                        spreadRadius: -3)
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TitleAndWidget(
                        title: AppStrings.jobtype.tr,
                        childWidget: CustomTextFormField(
                          controller: controller.jobType,
                          hintText: AppStrings.jobtype.tr,
                          textInputType: TextInputType.multiline,
                          validator: (p0) {
                            return AppValidationFunctions
                                .stringValidationFunction(
                                    p0, AppStrings.jobtype.tr);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TitleAndWidget(
                        title: AppStrings.workaddress.tr,
                        childWidget: CustomTextFormField(
                          hintText: AppStrings.workaddress.tr,
                          controller: controller.workAddress,
                          textInputType: TextInputType.multiline,
                          validator: (p0) {
                            return AppValidationFunctions
                                .stringValidationFunction(
                                    p0, AppStrings.workaddress.tr);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TitleAndWidget(
                        title: AppStrings.companyname.tr,
                        childWidget: CustomTextFormField(
                          hintText: AppStrings.companyname.tr,
                          controller: controller.companyName,
                          textInputType: TextInputType.multiline,
                          validator: (p0) {
                            return AppValidationFunctions
                                .stringValidationFunction(
                                    p0, AppStrings.companyname.tr);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TitleAndWidget(
                        title: AppStrings.taxnamber.tr,
                        childWidget: CustomTextFormField(
                          hintText: AppStrings.taxnamber.tr,
                          controller: controller.taxNumber,
                          textInputType: TextInputType.multiline,
                          validator: (p0) {
                            return AppValidationFunctions
                                .stringValidationFunction(
                                    p0, AppStrings.taxnamber.tr);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const AddFile(),
                      const SizedBox(
                        height: 16,
                      ),
                      const ShapeFileupload(),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        onButtonPressed: () {
                          // Get.toNamed(Routes.home);
                          if (!controller.formKey.currentState!.validate()) {
                            return;
                          }
                          if (controller.selectedFile.isEmpty) {
                            ToastManager.showError(AppStrings.uploadFile.tr);
                            return;
                          }
                          controller.submit();
                        },
                        buttonText: AppStrings.complete.tr,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
