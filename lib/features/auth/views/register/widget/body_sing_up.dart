import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/features/auth/logic/controller/register_controller.dart';
import 'package:horsely_app/features/auth/views/register/widget/form_sing_up.dart';
import 'package:horsely_app/features/auth/views/register/widget/header_sing_up.dart';

class BodySingUp extends GetView<RegisterController> {
  const BodySingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const HeaderSingUp(),
          Container(
            height: MediaQuery.of(context).size.height +
                MediaQuery.of(context).size.height * 0.4,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
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
                  child: FormSingUp(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
