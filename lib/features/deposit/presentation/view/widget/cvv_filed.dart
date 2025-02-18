import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CVVField extends StatelessWidget {
  const CVVField({super.key, this.onSaved, this.validator, this.controller});

  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: onSaved,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number, // نوع الإدخال: أرقام فقط
      maxLength: 4, // عدد الأرقام المسموح بها (عادةً 3 أو 4 أرقام)
      validator: validator,
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
