import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

import '../../../components/widget_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../component/chip_list.dart';
import '../controller/lead_flow_cubit.dart';
import '../model/ui_models.dart';
import '../widgets/label_with_asterisk.dart';

class SubscribedStudentsSection extends StatelessWidget {
  const SubscribedStudentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadFlowCubit, LeadFlowState>(
      builder: (context, state) {
        final cubit = LeadFlowCubit.get(context);
        if (state is GetAllPurposeLoading || cubit.purposesList == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          shrinkWrap: true,
          children: [
            const WidgetWithVerticalDivider(
              text: 'إملأ المعلومات الإضافية لتمكيننا من توفير تجربة دراسية مخصصة لإحتياجاتك الفردية',
              dividerColor: AppColors.primaryYellow,
            ),
            Gap(height * 0.02),
            const LabelWithAsterisk(label: 'ما عدد الطلاب المشتركين'),
            ChipList(
              multiSelect: false,
              chips: studentCountList.map((e) => e.name).toList(),
              selectedChips: selectedStudentCountList,
            ),
            Gap(height * 0.01),
            const LabelWithAsterisk(label: 'حدد أهدافك الدراسية'),
            ChipList(
              chips: cubit.chipPurposesList!,
              selectedChips: selectedPurposesList,
            ),
          ],
        );
      },
    );
  }
}
