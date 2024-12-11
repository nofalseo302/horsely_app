import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/size_config.dart';

abstract class AppStyles {
  static TextStyle semibold24(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semibold22(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semibold12(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semibold18(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semibold14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semibold20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semibold16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle semibold32(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 32),
        fontWeight: FontWeight.w600,
        color: Colors.white);
  }

  static TextStyle regulare10(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 10),
        fontWeight: FontWeight.w400,
        color: Colors.white);
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
