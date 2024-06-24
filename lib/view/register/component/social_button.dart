import 'package:flutter/material.dart';
import 'package:lead_flow/constants/app_colors.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key, required this.image, required this.label, this.onPressed, this.iconSize = 36, this.topPadding = 0});
  final String image;
  final String label;
  final double iconSize;
  final double topPadding;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: topPadding),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Image.asset(image, width: iconSize, height: iconSize),
          label: Text(label),
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 4),
            textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.primaryGreen),
            ),
          ),
        ),
      ),
    );
  }
}
