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

class AppointmentsSection extends StatelessWidget {
  const AppointmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadFlowCubit, LeadFlowState>(
      builder: (context, state) {
        final cubit = LeadFlowCubit.get(context);
        if (state is GetAllDaysLoading || cubit.daysList == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          shrinkWrap: true,
          children: [
            const WidgetWithVerticalDivider(
              text: 'حدد الفتره الزمنية المناسة لك و سننظم الحصص وفقاً لجدولك الزمني بكل دقة.',
              dividerColor: AppColors.primaryGreen,
            ),
            Gap(height * 0.02),
            const LabelWithAsterisk(label: 'ما الأيام المناسبة لك'),
            ChipList(
              chips: cubit.chipDaysList!,
              selectedChips: selectedDaysList,
            ),
            Gap(height * 0.01),
            const LabelWithAsterisk(label: 'ما الفترة الزمنية المناسبة لك'),
            ChipList(
              multiSelect: false,
              chips: timePeriodList,
              selectedChips: selectedTimePeriodList,
            ),
            Gap(height * 0.01),
            const LabelWithAsterisk(label: 'إختر التوقيت المناسب لك'),
            ChipList(
              multiSelect: false,
              chips: timesList,
              selectedChips: selectedTimesList,
            ),
          ],
        );
      },
    );
  }
}
