import 'package:flutter/material.dart';
import 'package:horsely_app/features/pindeing_review/presentation/view/widget/body_pending_review.dart';

class PendingReviewScreen extends StatelessWidget {
  const PendingReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PendingReviewBody(),
    );
  }
}
