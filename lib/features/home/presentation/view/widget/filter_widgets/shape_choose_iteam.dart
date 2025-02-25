import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class ShapeChoose extends StatefulWidget {
  const ShapeChoose(
      {super.key,
      required this.titel,
      this.isSelected = false,
      required this.onSelected,
      required this.id});
  final String titel;
  final int id;
  final bool isSelected;
  final Function(int) onSelected;
  @override
  State<ShapeChoose> createState() => _ShapeChooseState();
}

class _ShapeChooseState extends State<ShapeChoose> {
  bool isSelected = false;
  @override
  void initState() {
    // TODO: implement initState
    isSelected = isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onSelected(widget.id);
          isSelected = !isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.backGray,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            children: [
              Text(
                widget.titel,
                style: AppStyles.semibold12(context)
                    .copyWith(color: isSelected ? Colors.white : Colors.black),
              ),
              if (isSelected) ...[
                const SizedBox(width: 8),
                Icon(
                    size: 20,
                    Icons.close,
                    color: isSelected ? Colors.white : AppColors.black),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
