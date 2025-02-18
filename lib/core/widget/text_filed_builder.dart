import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/core/widget/text_filed_commopnent.dart';
import 'package:horsely_app/features/account/features/account_setting.dart/presentation/manager/controler/languge_controler.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';

import 'package:intl_phone_field/intl_phone_field.dart';

class TextFieldBuilder extends StatelessWidget {
  final String title;
  final bool isTimePicker;
  final bool isPassword;
  final bool isicon;
  final bool isIcon;
  final TextInputType keyboardType;
  final Widget? icon;
  final bool isPhone;
  final bool isDatePicker;
  final String? image;
  final Function(String)? datePickerFunction;
  final Function(String)? timePickerFunction; // Time picker function callback
  final TextEditingController? controller;
  final TextEditingController? countryController;
  final Color? bgColor;
  final int? maxLines;
  final bool showCode;
  final bool? readOnly;

  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldBuilder({
    super.key,
    required this.title,
    this.isicon = false,
    this.icon,
    this.isTimePicker = false, // Default to false
    this.isIcon = false,
    this.isPassword = false,
    this.countryController,
    this.keyboardType = TextInputType.text,
    this.isPhone = false,
    this.isDatePicker = false,
    this.showCode = true,
    this.maxLines = 1,
    this.controller,
    this.datePickerFunction,
    this.timePickerFunction, // Add timePickerFunction parameter
    this.bgColor,
    this.image,
    this.readOnly,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FittedBox(
                          child: Text(title,
                              style: AppStyles.semibold16(context))),
                      if (isIcon) const Spacer(),
                      if (isIcon) icon ?? const SizedBox()
                    ],
                  )
                : Text(title, style: AppStyles.semibold16(context)),
            const SizedBox(height: 16),
            isPhone
                ? IntlPhoneField(
                    invalidNumberMessage:
                        AppStrings.phoneNumberMustBeEntered.tr,
                    disableLengthCheck: false,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: title,
                      contentPadding: const EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: AppColors.backGray,
                          )),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: AppColors.backGray,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.backGray,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: AppColors.backGray,
                        ),
                      ),
                    ),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primaryColor.withOpacity(0.03),
                    ),
                    initialCountryCode: 'EG',
                    controller: controller,
                    validator: (value) {
                      if ((value?.completeNumber ?? "").isEmpty ||
                          (controller?.text ?? '').isEmpty) {
                        return AppStrings.thisFieldIsRequired.tr;
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    showCountryFlag: showCode,
                    showDropdownIcon: showCode,
                    dropdownIconPosition: IconPosition.trailing,
                    style: Get.textTheme.labelSmall,
                    pickerDialogStyle: PickerDialogStyle(
                      backgroundColor: AppColors.white,
                      countryNameStyle: Get.textTheme.labelSmall!,
                      countryCodeStyle: Get.textTheme.labelSmall!,
                    ),
                    languageCode: (Get.find<LanguageController>()
                            .currentLanguage
                            .value
                            ?.languageCode) ??
                        "en",
                    onCountryChanged: (value) {
                      countryController?.text = value.code;
                    },
                    onChanged: (phone) {
                      if (controller?.text.startsWith('0') ?? false) {
                        controller?.text = controller!.text.substring(1);
                      }
                      countryController?.text =
                          phone.countryCode.isEmpty ? '20' : phone.countryCode;
                    },
                  )
                : TextFieldComponent(
                    hint: title,
                    validator: validator ??
                        (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.thisFieldIsRequired.tr;
                          }

                          return null;
                        },
                    inputFormatters: [
                      ...inputFormatters ?? [],
                    ],
                    fillColor: bgColor,
                    isReadOnly: readOnly ?? false,
                    keyboardType: keyboardType,
                    maxlines: maxLines,
                    hasShowPasswordIcon: isPassword,
                    controller: controller,
                    suffixIcon: isDatePicker
                        ? const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: CustomImageHandler(
                              AppImages.camer,
                              color: AppColors.primaryColor,
                            ),
                          )
                        : isTimePicker
                            ? const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: CustomImageHandler(
                                  AppImages.time, // Use an icon for time
                                ),
                              )
                            : image == null
                                ? null
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: CustomImageHandler(
                                      image,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                    onPress: !isDatePicker && !isTimePicker
                        ? null
                        : () {
                            if (isDatePicker) {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                              ).then(
                                (value) {
                                  if (value != null) {
                                    datePickerFunction!(value.toString());
                                  }
                                },
                              );
                            } else if (isTimePicker) {
                              showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then(
                                (value) {
                                  if (value != null &&
                                      timePickerFunction != null) {
                                    // ✅ Safe check
                                    timePickerFunction!(value.toString());
                                  }
                                },
                              );
                            }
                          },
                    textStyle: AppStyles.semibold14(context)
                        .copyWith(color: Colors.black),
                  )
          ],
        ),
      ),
    );
  }
}
