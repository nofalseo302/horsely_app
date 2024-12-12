import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/email_text_filed.dart';
import 'package:horsely_app/core/widget/phone_wiidget.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/account/features/information_user/presentation/controler/image_controller.dart';

class BodyInformationUser extends StatelessWidget {
  final ImageController imageController = Get.put(ImageController());

  BodyInformationUser({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Column(
                        children: [
                          Align(
                            child: GestureDetector(
                              onTap: () => _showImageSourceBottomSheet(context),
                              child: Stack(children: [
                                Obx(() {
                                  return CircleAvatar(
                                    backgroundColor: const Color(0xffEDEDED),
                                    backgroundImage: imageController
                                            .selectedImagePath.value.isNotEmpty
                                        ? FileImage(File(imageController
                                            .selectedImagePath.value))
                                        : const AssetImage(AppImages.userphoto)
                                            as ImageProvider,
                                    radius: 50,
                                  );
                                }),
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                      child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(.5),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              AppImages.camera),
                                        )),
                                  )),
                                ),
                              ]),
                            ),
                          ),
                          TitleAndWidget(
                              title: AppStrings.name.tr,
                              childWidget: const CustomTextFormField(
                                  hintText: "",
                                  textInputType: TextInputType.text)),
                          const SizedBox(
                            height: 16,
                          ),
                          TitleAndWidget(
                              title: AppStrings.email.tr,
                              childWidget: const EmailTextFiled(
                                  hintText: "",
                                  textInputType: TextInputType.text)),
                          const SizedBox(
                            height: 16,
                          ),
                          // TitleAndWidget(
                          //     title: AppStrings.phone.tr,
                          //     childWidget: MobileTextfiled(

                          //       onSaved: (s) {},
                          //     )),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomButton(
                        onButtonPressed: () {}, buttonText: "Save"),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showImageSourceBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16.0),
        height: 150,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
        ),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () {
                imageController.pickImageFromCamera();
                Get.back(); // لإغلاق الـ BottomSheet
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
              onTap: () {
                imageController.pickImageFromGallery();
                Get.back(); // لإغلاق الـ BottomSheet
              },
            ),
          ],
        ),
      ),
    );
  }
}
