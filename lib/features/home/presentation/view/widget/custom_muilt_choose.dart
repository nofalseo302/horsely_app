import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';

class CustomAnimatedDropdownMuilt extends StatefulWidget {
  final List<String> items; // قائمة العناصر
  final String title;
  final List<String> selectedValues; // القيم المختارة
  final Function(List<String>) onChanged;

  const CustomAnimatedDropdownMuilt({
    super.key,
    required this.items,
    required this.title,
    required this.selectedValues,
    required this.onChanged,
  });

  @override
  _CustomAnimatedDropdownState createState() => _CustomAnimatedDropdownState();
}

class _CustomAnimatedDropdownState extends State<CustomAnimatedDropdownMuilt> {
  List<String> selectedItems = [];

  @override
  void initState() {
    super.initState();
    selectedItems = List.from(widget.selectedValues);
  }

  @override
  Widget build(BuildContext context) {
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
      child: GestureDetector(
        onTap: () async {
          List<String>? newSelection = await showDialog(
            context: context,
            builder: (context) => MultiSelectDialog(
              items: widget.items,
              selectedItems: selectedItems,
            ),
          );

          if (newSelection != null) {
            setState(() {
              selectedItems = newSelection;
            });
            widget.onChanged(selectedItems);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedItems.isNotEmpty
                    ? selectedItems.join(', ')
                    : widget.title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Image.asset(AppImages.arrowDown),
          ],
        ),
      ),
    );
  }
}

class MultiSelectDialog extends StatefulWidget {
  final List<String> items;
  final List<String> selectedItems;

  const MultiSelectDialog({
    super.key,
    required this.items,
    required this.selectedItems,
  });

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  late List<String> tempSelectedItems;

  @override
  void initState() {
    super.initState();
    tempSelectedItems = List.from(widget.selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("اختر العناصر"),
      content: SingleChildScrollView(
        child: Column(
          children: widget.items.map((item) {
            return CheckboxListTile(
              title: Text(item),
              value: tempSelectedItems.contains(item),
              onChanged: (bool? selected) {
                setState(() {
                  if (selected == true) {
                    tempSelectedItems.add(item);
                  } else {
                    tempSelectedItems.remove(item);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, null),
          child: const Text("إلغاء"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, tempSelectedItems),
          child: const Text("تأكيد"),
        ),
      ],
    );
  }
}
