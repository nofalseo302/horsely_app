import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/size_config.dart';

const double kWidth = 393;
const double kHeight = 852;

extension DoubleExtensions on num {
  double get h {
    return (this / kHeight) * SizeConfig.screenHeight;
  }

  double get w {
    return (this / kWidth) * SizeConfig.screenWidth;
  }

  double get sp {
    return SizeConfig.textScaler.scale(toDouble());
  }

  double get r {
    return this * min((Get.width / kWidth), Get.height / kHeight);
  }

  SizedBox get verticalSpace {
    return SizedBox(height: (this / kHeight) * SizeConfig.screenHeight);
  }

  SizedBox get horizontalSpace {
    return SizedBox(width: (this / kWidth) * SizeConfig.screenWidth);
  }
}

extension EdgeInsetsExtension on EdgeInsets {
  /// Creates adapt insets using r [SizeExtension].
  EdgeInsets get r => copyWith(
        top: top.r,
        bottom: bottom.r,
        right: right.r,
        left: left.r,
      );

  EdgeInsets get w => copyWith(
        top: top.w,
        bottom: bottom.w,
        right: right.w,
        left: left.w,
      );

  EdgeInsets get h => copyWith(
        top: top.h,
        bottom: bottom.h,
        right: right.h,
        left: left.h,
      );

  EdgeInsets get p => copyWith(
        top: top.h,
        bottom: bottom.h,
        right: right.w,
        left: left.w,
      );
}
