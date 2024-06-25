import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';

import '../../../constants/app_colors.dart';

class ControlButtonsRow extends StatelessWidget {
  const ControlButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.02),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => LeadFlowCubit.get(context).decreaseProgress(),
              icon: const Icon(Icons.keyboard_double_arrow_right, color: AppColors.primaryGreen),
              label: const Text('السابق', style: TextStyle(color: AppColors.primaryGreen)),
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.primaryGreen,
                backgroundColor: Colors.white,
                side: const BorderSide(color: AppColors.primaryGreen),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          Gap(width * 0.03),
          Expanded(
            child: ElevatedButton(
              onPressed: () => LeadFlowCubit.get(context).increaseProgress(),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primaryGreen,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('التالي'),
                  Gap(8),
                  Icon(Icons.keyboard_double_arrow_left),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
