import 'package:flutter/material.dart';

class CVVField extends StatelessWidget {
  const CVVField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onSaved,
      keyboardType: TextInputType.number, // نوع الإدخال: أرقام فقط
      maxLength: 4, // عدد الأرقام المسموح بها (عادةً 3 أو 4 أرقام)
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        } else if (value.length < 3) {
          return 'يجب إدخال 3 أو 4 أرقام';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'CVV',
        counterText: "", // لإخفاء عداد الأحرف أسفل الحقل
        // أيقونة قفل بجانب الحقل
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
