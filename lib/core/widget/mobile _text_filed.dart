import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class CustomMobileField extends StatefulWidget {
  const CustomMobileField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.onSaved,
    this.obscureText = false,
  });

  final String hintText;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  _CustomMobileFieldState createState() => _CustomMobileFieldState();
}

class _CustomMobileFieldState extends State<CustomMobileField> {
  final TextEditingController _controller = TextEditingController();
  // ignore: unused_field
  int _charCount = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _charCount = _controller.text.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        controller: _controller,
        obscureText: widget.obscureText,
        onChanged: widget.onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          if (value.length != 10) {
            return 'يجب أن يحتوي على 10 أرقام';
          }
          return null;
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly, // السماح بالأرقام فقط
          LengthLimitingTextInputFormatter(10), // الحد الأقصى 10 أرقام
        ],
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          hintStyle: AppStyles.semibold14(context).copyWith(
            color: Colors.grey,
          ),
          hintText: widget.hintText,
          filled: true,
          fillColor: const Color(0xFFFFFFFF),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        width: 1,
        color: Colors.grey.shade300,
      ),
    );
  }
}
