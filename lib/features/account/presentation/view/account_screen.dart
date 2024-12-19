import 'package:flutter/material.dart';
import 'package:horsely_app/features/account/presentation/view/widget/body_account.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyAccount(),
    );
  }
}
