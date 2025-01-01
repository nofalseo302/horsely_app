import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/widget/send_text_filed.dart';
import 'package:horsely_app/features/account/features/support/live_chat/presentation/manager/controler/live_Chat_controler.dart';
import 'package:image_picker/image_picker.dart';

class SendSection extends StatelessWidget {
  final ScrollController scrollController;

  const SendSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final LiveChatController controller = Get.find();
    final TextEditingController messageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                Get.bottomSheet(Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.25),
                            blurRadius: 3,
                            spreadRadius: 1,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.pickImage(ImageSource.camera);
                            },
                            child: Row(
                              children: [
                                Text(
                                  AppStrings.camera.tr,
                                  style: AppStyles.semibold14(context),
                                ),
                                const Spacer(),
                                const Icon(Icons.camera_alt_sharp),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.pickImage(ImageSource.gallery);
                            },
                            child: Row(
                              children: [
                                Text(
                                  AppStrings.gallery.tr,
                                  style: AppStyles.semibold14(context),
                                ),
                                const Spacer(),
                                const Icon(Icons.image)
                              ],
                            ),
                          ),
                        ],
                      ),
                    )));
              },
              child: Image.asset(AppImages.camer)),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: SendTextFiled(
                controller: messageController, // Pass the controller here
                suffixIcon: const Icon(Icons.emoji_emotions_outlined,
                    color: Color(0xff28303F)),
                hintText: "Message...",
                textInputType: TextInputType.text,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              if (messageController.text.isNotEmpty) {
                controller.addMessage(messageController.text, 'user');

                messageController.clear();

                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );

                Future.delayed(const Duration(seconds: 1), () {
                  controller.addMessage("This is a bot response", 'bot');

                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                });
              }
            },
            child: Image.asset(AppImages.send),
          ),
        ],
      ),
    );
  }
}
