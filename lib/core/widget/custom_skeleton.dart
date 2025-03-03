import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';

enum CustomState { loading, success, empty, failure }

class CustomSkeletonizer extends StatelessWidget {
  final Widget child;
  final CustomState state;
  final Widget? emptyWidget;
  final Widget? emptyLoadWidget;
  final Future Function()? onFail;
  final Color color;
  final double opacity;

  const CustomSkeletonizer({
    Key? key,
    required this.child,
    required this.emptyLoadWidget,
    required this.state,
    this.emptyWidget,
    this.onFail,
    this.color = AppColors.primaryColor,
    this.opacity = 0.9,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case CustomState.loading:
        return Skeletonizer(
            enabled: true,
            effect: ShimmerEffect(highlightColor: Colors.green.shade400),
            child: emptyLoadWidget ?? Container());

      case CustomState.success:
        return child;

      case CustomState.empty:
        return emptyWidget ??
            Center(
              child: Text(
                "لا توجد بيانات متاحة",
                style: AppStyles.semibold20(context),
              ),
            );

      case CustomState.failure:
        return RetryWidget(onRetry: () async {
          if (onFail != null) {
            await onFail!();
          }
        });

      default:
        return child;
    }
  }
}
