import 'package:flutter/material.dart';
import 'package:horsely_app/features/auth/views/email_rest/widget/body_enter_email;.dart';

class EmailRestPasswordScreen extends StatelessWidget {
  const EmailRestPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyEnterEmail(),
    );
  }
}
