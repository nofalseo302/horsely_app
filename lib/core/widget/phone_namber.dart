// import 'package:flutter/material.dart';
// import 'package:horsely_app/core/controler/Phone_number_controller.dart';
// import 'package:get/get.dart';

// class PhoneNumberField extends StatelessWidget {
//   const PhoneNumberField({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final PhoneNumberController controller = Get.put(PhoneNumberController());
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           InternationalPhoneNumberInput(
//             onInputChanged: (PhoneNumber number) {
//               controller
//                   .updatePhoneNumber(number); // تحديث عند تغيير رقم الهاتف
//             },
//             selectorConfig: const SelectorConfig(
//               selectorType:
//                   PhoneInputSelectorType.DROPDOWN, // نوع اختيار الدولة
//             ),
//             ignoreBlank: false,
//             autoValidateMode: AutovalidateMode.onUserInteraction,
            
//             initialValue: PhoneNumber(isoCode: 'EG'), // الدولة الافتراضية
//             inputDecoration: const InputDecoration(
//               labelText: 'Phone Number',
//               border: OutlineInputBorder(
//                 borderSide: BorderSide(),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           // Display the selected phone number and country code using GetX
//           Obx(() {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Phone Number: ${controller.phoneNumber.value}'),
//                 Text('Country Code: ${controller.countryCode.value}'),
//               ],
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
