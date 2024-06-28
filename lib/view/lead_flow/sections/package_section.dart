import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/view/lead_flow/component/subscription_chip_list.dart';

import '../../../components/widget_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../component/chip_list.dart';
import '../controller/lead_flow_cubit.dart';
import '../model/ui_models.dart';
import '../widgets/label_with_asterisk.dart';

class PackageSection extends StatelessWidget {
  const PackageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadFlowCubit, LeadFlowState>(
      builder: (context, state) {
        final cubit = LeadFlowCubit.get(context);
        if (state is GetAllSubscriptionLoading || cubit.subscriptionsList == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.06),
          shrinkWrap: true,
          children: [
            const WidgetWithVerticalDivider(
              text: 'كون الباقة التي تناسبك مع إحتياجاتك و سنضمن لك أقصى إستفادة من كل حصة.',
              dividerColor: AppColors.primaryYellow,
            ),
            Gap(height * 0.02),
            const LabelWithAsterisk(label: 'كم حصة إسبوعياً'),
            ChipList(
              multiSelect: false,
              chips: sessionsList,
              selectedChips: selectedSessionsList,
            ),
            Gap(height * 0.01),
            const LabelWithAsterisk(label: 'كم عدد ساعات الحصة الواحدة'),
            ChipList(
              multiSelect: false,
              chips: hoursPerSessionList,
              selectedChips: selectedHoursPerSessionList,
            ),
            Gap(height * 0.01),
            const LabelWithAsterisk(label: 'مدة الإ شتراك'),
            SubscriptionChipList(
              chips: cubit.subscriptionsList!,
              selectedChips: selectedPackagesList,
            ),
          ],
        );
      },
    );
  }
}
