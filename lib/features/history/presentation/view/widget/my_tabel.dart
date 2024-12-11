import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class TabelHistory extends StatelessWidget {
  final List<List<String>> data; // قائمة من القوائم لتحديد البيانات لكل صف

  const TabelHistory({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Table(
      // تحديد الحدود
      border: const TableBorder(
        horizontalInside: BorderSide.none, // إزالة الحدود بين الصفوف
        verticalInside: BorderSide.none, // إزالة الحدود العمودية
      ),
      children: [
        // الصف الأول مع أسماء الأعمدة
        TableRow(
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: const Color(0xffD9D9D9).withOpacity(.5),
                    width: 1)), // حد أسفل الصف الأول
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 20, right: 20, bottom: 10),
              child: Text(AppStrings.time.tr,
                  style: AppStyles.semibold16(context)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Text(AppStrings.price.tr,
                  style: AppStyles.semibold16(context)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: FittedBox(
                child: Text(AppStrings.percentage.tr,
                    style: AppStyles.semibold16(context)),
              ),
            ),
          ],
        ),
        // تكرار البيانات لإنشاء الصفوف
        for (var row in data)
          TableRow(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                child: Text(
                  row[0], // الوقت
                  style: AppStyles.semibold16(context),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            '\$${row[1].split('.')[0]}', // الجزء الصحيح من السعر
                        style: AppStyles.semibold16(context)
                            .copyWith(color: Colors.black),
                      ),
                      TextSpan(
                        text:
                            '.${row[1].split('.')[1]}', // الجزء العشري من السعر
                        style: AppStyles.semibold12(context)
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
                child: Text(
                  row[2], // النسبة المئوية
                  style: AppStyles.semibold16(context)
                      .copyWith(color: Colors.green),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
