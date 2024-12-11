import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/complete_data/presentation/view/widget/shape_file-upload.dart';
import 'package:horsely_app/features/complete_data/presentation/view/widget/upload_file_widget.dart';

class BodyCompletData extends StatelessWidget {
  const BodyCompletData({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
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
                          childWidget: const CustomTextFormField(
                              hintText: "",
                              textInputType: TextInputType.multiline)),
                      const SizedBox(
                        height: 16,
                      ),
                      TitleAndWidget(
                          title: AppStrings.workaddress.tr,
                          childWidget: const CustomTextFormField(
                              hintText: "",
                              textInputType: TextInputType.multiline)),
                      const SizedBox(
                        height: 16,
                      ),
                      TitleAndWidget(
                          title: AppStrings.companyname.tr,
                          childWidget: const CustomTextFormField(
                              hintText: "",
                              textInputType: TextInputType.multiline)),
                      const SizedBox(
                        height: 16,
                      ),
                      TitleAndWidget(
                          title: AppStrings.taxnamber.tr,
                          childWidget: const CustomTextFormField(
                              hintText: "",
                              textInputType: TextInputType.multiline)),
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
                            Get.toNamed(Routes.home);
                          },
                          buttonText: AppStrings.complete.tr)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
