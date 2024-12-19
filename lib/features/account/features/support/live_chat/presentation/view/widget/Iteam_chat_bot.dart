import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';

class IteamChatBot extends StatelessWidget {
  const IteamChatBot({
    super.key,
   
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // لضبط الاتجاه لليسار
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffE9EFF5),
              radius: 25,
              child: SvgPicture.asset(AppImages.pincode),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xffE9EFF5),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, bottom: 8, right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Horsley bot",
                        style: AppStyles.semibold12(context).copyWith(
                          color: const Color(0xff8A8A8A),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "messagel",
                        style: AppStyles.semibold14(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        // إضافة التاريخ تحت الـ Container
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .2,
            ),
            Text(
              "12:30 PM", // يمكن تعديل التاريخ والوقت هنا
              style: AppStyles.semibold12(context).copyWith(
                color: const Color(0xff8A8A8A),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
