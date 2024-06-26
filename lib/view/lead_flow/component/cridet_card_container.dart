import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../constants/app_colors.dart';

class CridetCardContainer extends StatelessWidget {
  const CridetCardContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.primaryGreen),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.circle_outlined,
                size: 18,
                color: AppColors.primaryGreen,
              ),
              const Gap(4),
              Text('بطاقة إئتمان', style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.payment_outlined,
                color: AppColors.primaryGreen,
              ),
              Gap(4),
              Icon(
                Icons.local_atm,
                color: AppColors.primaryGreen,
              ),
              Gap(4),
              Icon(
                Icons.payments_outlined,
                color: AppColors.primaryGreen,
              ),
              Gap(4),
            ],
          ),
        ],
      ),
    );
  }
}
