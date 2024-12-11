import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';

class RetryWidget extends StatelessWidget {
  final Function onRetry;
  final String msg;

  const RetryWidget({
    super.key,
    required this.onRetry,
    this.msg = 'حدث خطأ ما',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // SvgPicture.asset(AppImages.error),
        const Icon(Icons.dangerous_rounded,
            color: Color.fromARGB(255, 238, 72, 72), size: 100),
        const SizedBox(
          height: 15,
          width: 1,
        ),
        ElevatedButton.icon(
          onPressed: () async {
            await onRetry();
          },
          label: const Text(
            '  AppStrings.retry.tr',
            style: TextStyle(color: AppColors.white, fontSize: 18),
          ),
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
          ),
          icon: const Icon(
            Icons.refresh,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
