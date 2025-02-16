import 'package:flutter/material.dart';
import 'package:horsely_app/features/wallet/view/widget/code_user_widget.dart';

class UserCode extends StatelessWidget {
  const UserCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
        child: EncryptedTextRow());
  }
}
