import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppValidationFunctions {
  static String? ibanValidationFunction(String? iban) {
    if (iban == null || iban.isEmpty) {
      return Get.locale!.languageCode == 'ar'
          ? 'رقم IBAN لا يمكن أن يكون فارغًا!'
          : "IBAN can't be empty!";
    }

    // Remove spaces and make it uppercase
    iban = iban.replaceAll(RegExp(r'\s+'), '').toUpperCase();

    // Regular expression to check if the IBAN contains only letters and digits
    final RegExp ibanRegExp = RegExp(r'^[A-Z0-9]{15,34}$');

    if (!ibanRegExp.hasMatch(iban)) {
      return Get.locale!.languageCode == 'ar'
          ? 'الرجاء إدخال رقم IBAN صحيح (يجب أن يحتوي على 15-34 حرفًا ورقمًا)'
          : 'Please enter a valid IBAN number (15 to 34 alphanumeric characters)';
    }

    // Move the first four characters to the end of the string
    String rearrangedIban = iban.substring(4) + iban.substring(0, 4);

    // Replace letters with digits (A=10, B=11, ..., Z=35)
    rearrangedIban = rearrangedIban.replaceAllMapped(RegExp(r'[A-Z]'), (match) {
      return (match.group(0)!.codeUnitAt(0) - 55).toString();
    });

    // Check if the number is divisible by 97
    if (BigInt.parse(rearrangedIban) % BigInt.from(97) != BigInt.zero) {
      return Get.locale!.languageCode == 'ar'
          ? 'رقم IBAN غير صالح!'
          : 'IBAN is not valid!';
    }

    return null;
  }

  static String? cardNumberValidationFunction(String? cardNumber) {
    if (cardNumber == null || cardNumber.isEmpty) {
      return Get.locale!.languageCode == 'ar'
          ? 'رقم البطاقة لا يمكن أن يكون فارغًا!'
          : "Card number can't be empty!";
    }

    // Remove any spaces and non-digit characters
    cardNumber = cardNumber.replaceAll(RegExp(r'\D'), '');

    // Regular expression to check if the card number contains only digits and has between 13 and 19 digits
    final RegExp cardNumberRegExp = RegExp(r'^\d{13,19}$');

    if (!cardNumberRegExp.hasMatch(cardNumber)) {
      return Get.locale!.languageCode == 'ar'
          ? 'الرجاء إدخال رقم بطاقة صحيح (من 13 إلى 19 رقم)'
          : 'Please enter a valid card number (13 to 19 digits)';
    }

    // Apply Luhn Algorithm to validate the card number
    if (!luhnCheck(cardNumber)) {
      return Get.locale!.languageCode == 'ar'
          ? 'رقم البطاقة غير صالح!'
          : 'Card number is not valid!';
    }

    return null;
  }

// Luhn Algorithm to check if the card number is valid
  static bool luhnCheck(String cardNumber) {
    int sum = 0;
    bool shouldDouble = false;

    // Loop through the digits in reverse order
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);

      if (shouldDouble) {
        digit *= 2;
        if (digit > 9) {
          digit -= 9;
        }
      }

      sum += digit;
      shouldDouble = !shouldDouble;
    }

    return sum % 10 == 0;
  }

  static String? cvvValidationFunction(String? cvv) {
    if (cvv == null || cvv.isEmpty) {
      return Get.locale!.languageCode == 'ar'
          ? 'رمز CVV لا يمكن أن يكون فارغًا!'
          : "CVV can't be empty!";
    }

    // Regular expression to match 3 or 4 digits
    final RegExp cvvRegExp = RegExp(r'^\d{3,4}$');

    if (!cvvRegExp.hasMatch(cvv)) {
      return Get.locale!.languageCode == 'ar'
          ? 'الرجاء إدخال رمز CVV صحيح (3 أو 4 أرقام)'
          : 'Please enter a valid CVV (3 or 4 digits)';
    }

    return null;
  }

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
    } else if (password!.length <= 8) {
      return Get.locale!.languageCode == 'ar'
          ? '!كلمة المرور يجب ان تحتوي اكثر من 8 ارقام او حروف'
          : "Password must have more than 8 charachters";
    } else if (password.length >= 50) {
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

    // Regular expression for a valid name (letters in Arabic or English, spaces allowed)
    final RegExp nameRegExp = RegExp(r'^[a-zA-Z\u0600-\u06FF 0-9]{3,50}$');

    if (!nameRegExp.hasMatch(fullName)) {
      return Get.locale!.languageCode == 'ar'
          ? 'الرجاء إدخال $fieldName صحيح (3-50 أحرف)'
          : 'Please enter a valid $fieldName (3-50 characters)';
    }

    return null;
  }

  static String? numberValidationFunction(String? input, String fieldName) {
    if (input == null || input.isEmpty) {
      return Get.locale!.languageCode == 'ar'
          ? '$fieldName لا يمكن أن يكون فارغًا!'
          : "$fieldName can't be empty!";
    }

    // Regular expression to check for numbers only (1-50 digits)
    final RegExp numberRegExp = RegExp(r'^\d{1,50}$');

    if (!numberRegExp.hasMatch(input)) {
      return Get.locale!.languageCode == 'ar'
          ? 'الرجاء إدخال $fieldName صحيح (رقم يتكون من 1 إلى 50 خانة بدون نصوص)'
          : 'Please enter a valid $fieldName (a number with 1-50 digits, no text allowed)';
    }

    return null;
  }

  static String? validateFourDigitNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }

    final isValid = RegExp(r'^\d{4}$').hasMatch(value);
    if (!isValid) {
      return 'Enter a valid 4-digit number';
    }

    return null; // Return null if the input is valid
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
