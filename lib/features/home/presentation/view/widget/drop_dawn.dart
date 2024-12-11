import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/controler/drop_dawn_controler.dart';

class CustomAnimatedDropdown extends StatelessWidget {
  final List<String> items; // قائمة العناصر
  final String titiel;
  const CustomAnimatedDropdown({required this.items, required this.titiel});

  @override
  Widget build(BuildContext context) {
    // الحصول على الكونترولر
    final DropdownController dropdownController = Get.put(DropdownController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // استخدام Obx لتحديث القائمة ديناميكيًا
        Obx(() => AnimatedContainer(
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
                  value: dropdownController.selectedItem.value.isEmpty
                      ? null
                      : dropdownController.selectedItem.value,
                  hint: Text(titiel),
                  icon: const Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    dropdownController.updateSelectedItem(newValue!);
                  },
                ),
              ),
            )),
      ],
    );
  }
}
