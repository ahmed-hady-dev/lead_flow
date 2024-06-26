import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

import '../../../components/widget_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../component/chip_list.dart';
import '../controller/lead_flow_cubit.dart';
import '../widgets/label_with_asterisk.dart';

class SubscribedStudentsSection extends StatelessWidget {
  const SubscribedStudentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LeadFlowCubit.get(context);
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
          chips: cubit.participatingStudentsList,
          selectedChips: cubit.selectedParticipatingStudentsList,
        ),
        Gap(height * 0.01),
        const LabelWithAsterisk(label: 'حدد أهدافك الدراسية'),
        ChipList(
          chips: cubit.targetsList,
          selectedChips: cubit.selectedTargetsList,
        ),
      ],
    );
  }
}
