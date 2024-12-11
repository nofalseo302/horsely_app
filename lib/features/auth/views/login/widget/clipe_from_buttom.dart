import 'package:flutter/material.dart';

class OvalBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, 0.0); // بدء المسار من أعلى اليسار
    path.lineTo(0.0, size.height - 50); // التحرك إلى أسفل الحاوية
    path.quadraticBezierTo(
      size.width / 2, size.height + 20, // نقطة التحكم لخلق انحناء للأسفل
      size.width, size.height - 50, // نهاية الانحناء
    );
    path.lineTo(size.width, 0.0); // العودة إلى أعلى يمين الحاوية
    path.close(); // إغلاق المسار
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
