import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:horsely_app/features/auth/views/email_rest/widget/form_enter_email.dart';
import 'package:horsely_app/features/auth/views/email_rest/widget/header_enter_emil.dart';

import '../../../logic/controller/forget_password_controller.dart';

class BodyEnterEmail extends GetView<ForgetPasswordController> {
  const BodyEnterEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const HeaderEnterEmil(),
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: 0,
            right: 0,
            child: Form(
              key: controller.formKey2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.25),
                        blurRadius: 10,
                        spreadRadius: -5,
                      )
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20,
                    ),
                    child: FromEnterEmail(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
