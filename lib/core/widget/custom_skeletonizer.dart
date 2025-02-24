import 'package:flutter/material.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:get/get.dart';

enum AnimationType {
  newtonCradle,
  staggeredDotsWave,
  threeArchedCircle,
  fourRotatingDots,
  hexagonDots,
  discreteCircular,

  skeletonizer,
}

enum currentState { loading, success, empty, failure }

class CustomLoadingAnimation extends StatelessWidget {
  final AnimationType animationType;
  final Color color;
  final double size;
  final bool enable;
  final Widget? widget;
  final Future Function() onFail;
  final Widget? emptyWidget;
  final currentState? state;

  const CustomLoadingAnimation(
      {super.key,
      required this.animationType,
      this.color = AppColors.primaryColor,
      this.size = 50.0,
      this.enable = true,
      this.widget,
      required this.onFail,
      this.emptyWidget,
      this.state = currentState.loading});

  @override
  Widget build(BuildContext context) {
    // if (!enable) return const widget;

    switch (animationType) {
      case AnimationType.newtonCradle:
        return LoadingAnimationWidget.newtonCradle(color: color, size: size);
      case AnimationType.staggeredDotsWave:
        return LoadingAnimationWidget.staggeredDotsWave(
            color: color, size: size);
      case AnimationType.threeArchedCircle:
        return LoadingAnimationWidget.threeArchedCircle(
            color: color, size: size);
      case AnimationType.fourRotatingDots:
        return LoadingAnimationWidget.fourRotatingDots(
            color: color, size: size);
      case AnimationType.hexagonDots:
        return LoadingAnimationWidget.hexagonDots(color: color, size: size);
      case AnimationType.discreteCircular:
        return LoadingAnimationWidget.discreteCircle(color: color, size: size);

      case AnimationType.skeletonizer:
        if (widget == null) {
          throw ArgumentError('Widget is required when using skeletonizer');
        }
        return state == currentState.loading || state == currentState.success
            ? Skeletonizer(
                enabled: enable,
                containersColor: color,
                effect: ShimmerEffect(highlightColor: color),
                child: widget!,
              )
            : state == currentState.empty
                ? emptyWidget ??
                    Center(
                        child: Text(
                      AppStrings.nodata.tr,
                      style: AppStyles.semibold20(context),
                    ))
                : RetryWidget(onRetry: () async {
                    onFail();
                  });
      default:
        return LoadingAnimationWidget.threeArchedCircle(
            color: color, size: size);
    }
  }
}
