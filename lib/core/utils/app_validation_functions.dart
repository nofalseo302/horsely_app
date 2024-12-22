import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppValidationFunctions {
  //Validation Functions for validating user input
  static String? emailValidationFunction(String? email) {
    if (email!.isEmpty) {
      return Get.locale!.languageCode == 'ar'
          ? 'البريد الإلكتروني لا يمكن أن يكون فارغًا!'
          : "Email can't be empty!";
    }

    // Regular expression for a valid email address
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z]+$',
    );

    if (!emailRegExp.hasMatch(email)) {
      return Get.locale!.languageCode == 'ar'
          ? 'الرجاء إدخال عنوان بريد إلكتروني صحيح'
          : 'Please enter a valid email address';
    }

    return null;
  }

  static String? nameValidationFunction(String? email) {
    if (email!.isEmpty) {
      return Get.locale!.languageCode == 'ar'
          ? 'الاسم  لا يمكن أن يكون فارغًا!'
          : "name can't be empty!";
    }

    // Regular expression for a valid email address
    final RegExp nameRegExp = RegExp(
      r'^[a-zA-Z\u0621-\u064A\u0660-\u0669 ]{3,50}$',
    );

    if (!nameRegExp.hasMatch(email)) {
      return Get.locale!.languageCode == 'ar'
          ? "الرجاء ادخال اسم صحيح"
          : 'Please enter a valid name ';
    }

    return null;
  }

  static String? passwordValidationFunction(String? password) {
    if (password == '') {
      return Get.locale!.languageCode == 'ar'
          ? 'كلمة المرور لا يمكن ان تكون فارغة !'
          : "Password can't be empty";
    } else if (password!.length < 8) {
      return Get.locale!.languageCode == 'ar'
          ? '!كلمة المرور يجب ان تحتوي اكثر من 8 ارقام او حروف'
          : "Password must have more than 8 charachters";
    } else if (password.length > 50) {
      return Get.locale!.languageCode == 'ar'
          ? '!كلمة المرور يجب ان تحتوي علي الاكثر  ٥٠   حرف'
          : "Password must have less than 50 charachters";
    } else {
      return null;
    }
  }

  static String? phoneValidationFunction(String? phoneNumber) {
    final RegExp phoneRegex = RegExp(r'^\+?[\d]{7,}$');
    if (!phoneRegex.hasMatch(phoneNumber!)) {
      return Get.locale!.languageCode == 'ar'
          ? 'رقم الهاتف غير صالح'
          : 'phone number is not valid';
    }
    return null;
  }

  static String? nationalnumberValidationFunction(String? number) {
    //write regex that makes sure it has only digits an d not more than 20 digit and not smaller than 9 digits
    final RegExp reg = RegExp(r'^\d{9,20}$');
    if (!reg.hasMatch(number!)) {
      return Get.locale!.languageCode == 'ar'
          ? 'رقم الهاتف غير صالح'
          : 'enter a valid national  number';
    }
    return null;
  }

  static String? stringValidationFunction(String? fullName, String fieldName) {
    if (fullName == null || fullName.isEmpty) {
      return Get.locale!.languageCode == 'ar'
          ? '$fieldName لا يمكن أن يكون فارغًا!'
          : "$fieldName can't be empty!";
    }

    // Regular expression for a valid name (letters only)
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z ]{3,50}$');

    if (!nameRegExp.hasMatch(fullName)) {
      return Get.locale!.languageCode == 'ar'
          ? 'الرجاء إدخال $fieldName صحيح (3-30 أحرف)'
          : 'Please enter a valid $fieldName (3-50 characters)';
    }

    return null;
  }
}

class NoSpaceInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // If the new value contains spaces, reject it
    if (newValue.text.contains(' ')) {
      // Return the old value to prevent inserting spaces
      return oldValue;
    }
    // Otherwise, accept the new value
    return newValue;
  }
}
