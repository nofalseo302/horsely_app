import 'package:flutter/material.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/code_user_widget.dart';

class UserCode extends StatelessWidget {
  const UserCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffB7DACC).withOpacity(.5),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
      ),
      child: const Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
          child: EncryptedTextRow()),
    );
  }
}



