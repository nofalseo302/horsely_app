import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../utils/app_colors.dart';

class MobileTextfiled extends StatelessWidget {
  final String title;
  final bool isPassword;
  final TextInputType keyboardType;
  final bool isPhone;
  final bool isDatePicker;
  final Function(String)? datePickerFunction;
  final TextEditingController? controller;
  final TextEditingController? countryController;
  final Color? bgColor;
  final int? maxLines;
  final bool? readOnly;
  final bool? autoFocus;
  final String? Function(String?)? validator;
  final Function(String? value)? onSubmit;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final void Function(String?)? onPressed;
  final String? hintText;

  const MobileTextfiled({
    super.key,
    required this.title,
    this.isPassword = false,
    this.countryController,
    this.onSubmit,
    this.autoFocus,
    this.keyboardType = TextInputType.text,
    this.isPhone = false,
    this.isDatePicker = false,
    this.maxLines = 1,
    this.controller,
    this.datePickerFunction,
    this.bgColor,
    this.readOnly,
    this.validator,
    this.inputFormatters,
    this.padding,
    this.onPressed,
    this.hintText,
  });
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(
          RegExp(r'[1-9]'),
        )
      ],
      validator: (value) async {
        if ((value?.completeNumber ?? "").isEmpty ||
            (controller?.text ?? '').isEmpty) {
          return "Enter Invalid Phone Number ";
        }
        return null;
      },
      invalidNumberMessage: 'Invalid phone number',
      disableLengthCheck: false,
      onSubmitted: onSubmit,
      autofocus: autoFocus ?? false,
      decoration: InputDecoration(
        // labelText: ,
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: Get.textTheme.labelSmall!.copyWith(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        hintText: hintText ?? '',
        hintStyle: Get.textTheme.bodySmall!.copyWith(
          color: AppColors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
      ),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primaryColor.withOpacity(0.03),
      ),
      initialCountryCode: 'EG',

      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      dropdownIconPosition: IconPosition.trailing,
      style: Get.textTheme.bodyMedium,
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: Colors.white,
        countryNameStyle: Get.textTheme.labelSmall!,
        countryCodeStyle: Get.textTheme.labelSmall!,
      ),
      // languageCode: Get.find<LanguageController>()
      //     .currentLanguage
      //     .value!
      //     .languageCode,
      onCountryChanged: (value) {
        print(value.code);
        countryController?.text = value.code;
      },
      onChanged: (phone) {
        print(phone.countryCode);
        print(phone.completeNumber);
        controller?.text = phone.number;
        countryController?.text =
            phone.countryCode.isEmpty ? '20' : phone.countryCode;
      },
    );
  }
}
