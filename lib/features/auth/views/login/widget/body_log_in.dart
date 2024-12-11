import 'package:flutter/material.dart';

import 'package:horsely_app/features/auth/views/login/widget/form_login.dart';
import 'package:horsely_app/features/auth/views/login/widget/header_log_in.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const HeaderLogin(),
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top:
                MediaQuery.of(context).size.height * 0.25, // زودت القيمة عن 100
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
                          spreadRadius: -5)
                    ]),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                  child: FormLogin(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
