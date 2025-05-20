import 'package:atividade4/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool filled;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.filled = true,
    this.color = AppColors.primary,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: filled ? color : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: filled ? null : Border.all(color: color, width: 1.5),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: filled ? Colors.white : color,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
