import 'package:flutter/material.dart';
import 'package:horsely_app/features/pinding_complete_data/presentation/view/widget/pending_complete_data_body.dart';

class PindingCompleteDataScreen extends StatelessWidget {
  const PindingCompleteDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BendingCompletDataBody(),
    );
  }
}
