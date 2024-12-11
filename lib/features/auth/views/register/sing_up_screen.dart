import 'package:flutter/material.dart';

import 'package:horsely_app/features/auth/views/register/widget/body_sing_up.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodySingUp(),
    );
  }
}
