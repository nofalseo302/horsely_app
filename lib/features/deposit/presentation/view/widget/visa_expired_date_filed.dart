import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // حزمة لتنسيق التاريخ

class VisaExpiryDateField extends StatefulWidget {
  const VisaExpiryDateField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  State<VisaExpiryDateField> createState() => _VisaExpiryDateFieldState();
}

class _VisaExpiryDateFieldState extends State<VisaExpiryDateField> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // لا يمكن اختيار تاريخ في الماضي
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text =
            DateFormat('MM/yy').format(picked); // تنسيق التاريخ MM/YY
      });
      widget.onSaved?.call(_dateController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      onChanged: widget.onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      readOnly: true, // المستخدم لا يمكنه كتابة التاريخ مباشرة
      onTap: () =>
          _selectDate(context), // عند الضغط على الحقل يتم عرض DatePicker
      decoration: InputDecoration(
        hintText: 'MM/YY', // تنسيق شهر/سنة
        suffixIcon:
            const Icon(Icons.calendar_today), // أيقونة لفتح الـ DatePicker
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: const Color(0xff00000040).withOpacity(.25),
      ),
    );
  }
}
