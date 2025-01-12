import 'package:flutter/material.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart'; // Add shimmer package

class SliderButton extends StatefulWidget {
  final double width;
  final double height;
  final String label;
  final Color backgroundColor;
  final Color buttonColor;
  final VoidCallback onSlideComplete;

  const SliderButton({
    super.key,
    required this.width,
    required this.height,
    this.label = "> > >",
    this.backgroundColor = Colors.grey,
    this.buttonColor = Colors.blue,
    required this.onSlideComplete,
  });

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  double buttonPosition = 0.0;
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        // Background track
        Positioned(
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(widget.height / 2),
            ),
            alignment: Alignment.center,
          ),
        ),
        Positioned(
          right: 30,
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey[300]!,
            child: Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ),
        ),
        // Sliding button
        Positioned(
          left: buttonPosition,
          child: GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                // Move button within the width bounds
                buttonPosition += details.delta.dx;
                if (buttonPosition < 0) buttonPosition = 0;
                if (buttonPosition > widget.width - widget.height) {
                  buttonPosition = widget.width - widget.height;
                  if (!isComplete) {
                    isComplete = true;
                    widget.onSlideComplete();
                  }
                } else {
                  isComplete = false;
                }
              });
            },
            onHorizontalDragEnd: (details) {
              // Reset the button position to the start if slide is incomplete
              setState(() => buttonPosition = 0);
            },
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Container(
                alignment: Alignment.center,
                width: widget.height * 1.5, // Make it wider for stadium shape
                height: widget.height - 10,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular((widget.height - 10) / 2),
                ),
                child: Text(
                  AppStrings.start.tr,
                  style: const TextStyle(
                    color: Color(0xff4D221E),
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
