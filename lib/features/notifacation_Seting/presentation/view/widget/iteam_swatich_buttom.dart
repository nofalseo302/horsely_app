import 'package:flutter/material.dart';

class ReadReceiptToggle extends StatefulWidget {
  @override
  _ReadReceiptToggleState createState() => _ReadReceiptToggleState();
}

class _ReadReceiptToggleState extends State<ReadReceiptToggle> {
  bool isReadReceiptsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Switch(
          activeColor: Colors.green,
          value: isReadReceiptsEnabled,
          onChanged: (value) {
            setState(() {
              isReadReceiptsEnabled = value; // تغيير حالة الزر
            });
          },
        ),
      ],
    );
  }
}
