import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

import '../../../constants/app_colors.dart';
import '../controller/lead_flow_cubit.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    double horizontalPadding = widget.width * 0.06;
    final cubit = LeadFlowCubit.get(context);
    return BlocBuilder<LeadFlowCubit, LeadFlowState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Stack(
            children: [
              Container(
                width: widget.width - 2 * horizontalPadding - 2,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                curve: Curves.decelerate,
                width: cubit.progress * (widget.width - 2 * horizontalPadding) - 4,
                height: 12,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              AnimatedPositionedDirectional(
                duration: const Duration(milliseconds: 600),
                curve: Curves.decelerate,
                start: cubit.progress * (widget.width - 2 * horizontalPadding) - 15,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: cubit.completeFlowIndex == 7 ? AppColors.primaryGreen : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primaryGreen, width: 2),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
