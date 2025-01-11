import 'package:flutter/material.dart';
import 'package:horsely_app/features/on_boarding/intro%20screen/presentation/view/widget/body_welcom.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyIntro(),
    );
  }
}
