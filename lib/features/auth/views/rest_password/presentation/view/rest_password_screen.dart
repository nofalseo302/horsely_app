import 'package:flutter/material.dart';
import 'package:horsely_app/features/auth/views/rest_password/presentation/view/widget/body_rest_password.dart';

class RestPasswordScreen extends StatelessWidget {
  const RestPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyRestPassword(),
    );
  }
}
