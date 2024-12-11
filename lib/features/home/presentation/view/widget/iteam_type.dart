import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/home/presentation/view/widget/iteam_choose_type.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ItemType extends StatelessWidget {
  const ItemType({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 3,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Row(
          children: [
            // Display the type (USDT)
            Text(
              "USDT",
              style: AppStyles.semibold14(context),
            ),
            // Button to show the bottom sheet
            IconButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          // Generate a list of item choices
                          ...List.generate(
                            5,
                            (index) => Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15.0, top: 15),
                              child: IteamChooseType(
                                index: index,
                              ),
                            ),
                          ),
                          const Spacer(), // Spacer to push buttons to the bottom
                          Row(
                            children: [
                              // Confirm button
                              Expanded(
                                child: CustomButton(
                                  onButtonPressed: () {
                                    // Add your confirm logic here
                                  },
                                  buttonText: "Confirm",
                                ),
                              ),
                              const SizedBox(width: 8), // Space between buttons
                              // Reset button
                              Expanded(
                                child: CustomButton(
                                  onButtonPressed: () {
                                    // Add your reset logic here
                                  },
                                  buttonText: "Reset",
                                  backgroundColor: AppColors.backgray,
                                  textColor: Colors.black,
                                  borderColor: AppColors.backgray,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.keyboard_arrow_down),
            ),
          ],
        ),
      ),
    );
  }
}
