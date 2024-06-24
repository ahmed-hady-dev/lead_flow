import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryGreen,
    this.radius = 24.0,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.bold,
  });
  final String text;
  final double radius;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color textColor;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
