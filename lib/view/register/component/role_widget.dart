import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

import '../../../constants/app_colors.dart';

class RoleWidget extends StatelessWidget {
  const RoleWidget({
    super.key,
    this.onTap,
    this.color,
    this.icon,
    required this.data,
    required this.condition,
  });
  final void Function()? onTap;
  final Color? color;
  final IconData? icon;
  final String data;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 20,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: width * 0.3,
              height: width * 0.3,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Icon(icon, color: Colors.white, size: 72),
            ),
            Gap(height * 0.01),
            Row(
              children: [
                condition
                    ? const Row(
                        children: [
                          Icon(Icons.check_circle_outline_rounded, color: AppColors.primaryGreen),
                          Gap(4),
                        ],
                      )
                    : const Gap(0),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    data,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: condition ? AppColors.primaryGreen : Colors.black,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
