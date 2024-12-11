import 'package:flutter/material.dart';

import 'package:horsely_app/features/auth/views/rest_password/presentation/view/widget/form_rest_password.dart';
import 'package:horsely_app/features/auth/views/rest_password/presentation/view/widget/header_rest_password.dart';

class BodyRestPassword extends StatelessWidget {
  const BodyRestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const HeaderRestPassword(),
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.32,
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
                  child: FormRestPassword(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
