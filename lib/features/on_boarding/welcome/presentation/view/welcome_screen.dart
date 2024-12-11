import 'package:flutter/material.dart';
import 'package:horsely_app/features/on_boarding/welcome/presentation/view/widget/body_welcom.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyWelcome(),
    );
  }
}
