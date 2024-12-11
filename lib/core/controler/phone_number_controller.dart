import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberController extends GetxController {
  var phoneNumber = ''.obs; // رقم الهاتف
  var countryCode = ''.obs; // كود الدولة

  void updatePhoneNumber(PhoneNumber number) {
    phoneNumber.value = number.phoneNumber ?? '';
    countryCode.value = number.isoCode ?? '';
  }
}
