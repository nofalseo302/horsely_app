// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/features/auth/logic/controller/local_auth_controller.dart';

class NumberPad extends GetView<LocalAuthController> {
  const NumberPad({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> numbers = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '',
      '0',
      '-1'
    ];
    return GridView.builder(
      shrinkWrap: true,
      itemCount: numbers.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) => numbers[index] == ''
          ? SizedBox()
          : ClipOval(
              child: GestureDetector(
                onTap: () {
                  if (numbers[index] == "-1") {
                    controller.removeFromSelectedNumbers();
                  } else {
                    controller.addToSelectedNumbers(numbers[index]);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backGray,
                    shape: BoxShape.circle,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    shape: CircleBorder(),
                    child: Center(
                      child: numbers[index] == '-1'
                          ? Icon(Icons.backspace_outlined)
                          : Text(
                              numbers[index],
                              style: context.textTheme.bodyLarge,
                            ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
