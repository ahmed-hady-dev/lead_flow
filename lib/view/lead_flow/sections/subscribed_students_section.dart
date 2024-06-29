import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../components/fallback_widget.dart';
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
        return RefreshIndicator(
          onRefresh: () async => await cubit.getAllPurpose(),
          child: ListView(
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
              if (state is GetAllPurposeFailed)
                const FallbackWidget()
              else
                Skeletonizer(
                  enabled: state is GetAllPurposeLoading || cubit.purposesList == null,
                  containersColor: Colors.black12,
                  child: ChipList(
                    chips: cubit.chipPurposesList ?? ['تحضير لإختبار', 'حل واجبات', 'زيادة درجاتي', 'أخرى'],
                    selectedChips: selectedPurposesList,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
