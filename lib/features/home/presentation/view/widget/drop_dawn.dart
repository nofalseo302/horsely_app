import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';

class CustomAnimatedDropdown extends StatelessWidget {
  final List<String> items; // قائمة العناصر
  final String titiel;
  final String? value;
  final Function(String?)? onChanged;
  const CustomAnimatedDropdown(
      {super.key,
      required this.items,
      required this.titiel,
      this.value,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    // الحصول على الكونترولر
    // final DropdownController dropdownController = Get.put(DropdownController());

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(titiel),
          icon: Image.asset(AppImages.arrowDown),
          isExpanded: true,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (newValue) {
            onChanged!(newValue);
            // dropdownController.updateSelectedItem(newValue!);
          },
        ),
      ),
    );
  }
}
