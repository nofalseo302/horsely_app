import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_namber_text_filed.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/home/presentation/view/widget/drop_dawn.dart';

class BodyBankInformation extends StatelessWidget {
  const BodyBankInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.25),
                      blurRadius: 4,
                      spreadRadius: -3)
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Column(
                children: [
                  const TitleAndWidget(
                      title: "Name  ",
                      childWidget: CustomTextFormField(
                          hintText: "",
                          textInputType: TextInputType.multiline)),
                  const SizedBox(
                    height: 16,
                  ),
                  const TitleAndWidget(
                      title: "ID  ",
                      childWidget: CustomNumericTextFormField(
                        hintText: "",
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  TitleAndWidget(
                      title: "Country  ",
                      childWidget: CustomAnimatedDropdown(
                        items: const ["Egypt", "USA"],
                        titiel: AppStrings.choosecountry.tr,
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  // TitleAndWidget(
                  //     title: "Phone  ",
                  //     childWidget: MobileTextfiled(
                  //       onSaved: (p0) {},
                  //     )),
                  const SizedBox(
                    height: 16,
                  ),
                  const TitleAndWidget(
                      title: "Adress  ",
                      childWidget: CustomTextFormField(
                          hintText: "",
                          textInputType: TextInputType.multiline)),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomButton(onButtonPressed: () {}, buttonText: "Confirm"),
          )
        ],
      ),
    );
  }
}
