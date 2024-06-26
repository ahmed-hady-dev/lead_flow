import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_colors.dart';
import '../controller/lead_flow_cubit.dart';

class TermsAndConditionRow extends StatelessWidget {
  const TermsAndConditionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<LeadFlowCubit, LeadFlowState>(
          builder: (context, state) {
            final cubit = LeadFlowCubit.get(context);
            return Checkbox(
              value: cubit.isTermsChecked,
              activeColor: AppColors.primaryGreen,
              onChanged: (bool? value) => cubit.checkTerms(value: value!),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            );
          },
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const [
                TextSpan(
                  text: 'اوافق علي ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: 'الشروط و الأحكام',
                  style: TextStyle(color: AppColors.primaryGreen, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
