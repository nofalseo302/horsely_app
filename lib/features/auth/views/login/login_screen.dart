import 'package:flutter/material.dart';
import 'package:horsely_app/features/auth/views/login/widget/body_log_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyLogin(),
    );
  }
}
