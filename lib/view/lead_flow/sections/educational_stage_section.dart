import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/view/lead_flow/widgets/label_with_asterisk.dart';

import '../../../components/widget_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../../../core/helpers/extensions.dart';
import '../component/chip_list.dart';
import '../controller/lead_flow_cubit.dart';
import '../model/ui_models.dart';

class EducationalStageSection extends StatelessWidget {
  const EducationalStageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LeadFlowCubit.get(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      shrinkWrap: true,
      children: [
        const WidgetWithVerticalDivider(
          text: 'اختر المرحلة الدراسية التي تناسبك و سنضمن لك افضل الخيارات التعليمية المتاحة.',
          dividerColor: AppColors.primaryYellow,
        ),
        Gap(height * 0.02),
        const LabelWithAsterisk(label: 'حدد المرحلة الدراسية'),
        ChipList(
          chips: stagesList.map((e) => e.name).toList(),
          selectedChips: selectedStagesList,
        ),
        Gap(height * 0.01),
        const LabelWithAsterisk(label: 'حدد صفك الدراسي'),
        ChipList(
          chips: classRoomsList.map((e) => e.name).toList(),
          selectedChips: selectedClassRoomsList,
        ),
        Gap(height * 0.01),
        const LabelWithAsterisk(label: 'حدد المنهج الدراسي'),
        ChipList(
          chips: courseStudyList.map((e) => e.name).toList(),
          selectedChips: selectedCourseStudyList,
        )
      ],
    );
  }
}
