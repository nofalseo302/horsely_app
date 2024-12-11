import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/features/account/presentation/manager/controler/account_controler.dart';
import 'package:horsely_app/features/account/presentation/view/widget/iteam_account.dart';
import 'package:horsely_app/features/account/presentation/view/widget/my_order_widget.dart';

class BodyAccount extends StatelessWidget {
  const BodyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    // استدعاء AccountController باستخدام Get
    final accountController = Get.put(AccountController());

    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          accountController
              .account.length, // توليد العناصر بناءً على طول القائمة
          (index) {
            // التحقق إذا كان الفهرس يساوي 3
            if (index == 2) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0, top: 8),
                child: MyOrderWidget(
                    accountEntity: accountController
                        .account[index]), // ويدجت مختلفة عند الرقم 3
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4.0, top: 8),
                child: IteamAccount(
                  accountEntity: accountController.account[index],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
