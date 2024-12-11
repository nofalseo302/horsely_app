import 'package:flutter/material.dart';
import 'package:horsely_app/features/on_boarding/presentation/view/widget/body_on_boarding_view.dart';

class OnBoardingScreeen extends StatelessWidget {
  const OnBoardingScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyOnBoarding(),
    );
  }
}
