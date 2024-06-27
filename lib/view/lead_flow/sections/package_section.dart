import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/view/lead_flow/component/subscription_chip_list.dart';

import '../../../components/widget_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../component/chip_list.dart';
import '../model/ui_models.dart';
import '../widgets/label_with_asterisk.dart';

class PackageSection extends StatelessWidget {
  const PackageSection({super.key});

  @override
  Widget build(BuildContext context) {
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
          chips: weeklyLessonsList,
          selectedChips: selectedWeeklyLessonsList,
        ),
        Gap(height * 0.01),
        const LabelWithAsterisk(label: 'كم عدد ساعات الحصة الواحدة'),
        ChipList(
          chips: hoursPerClassList,
          selectedChips: selectedHoursPerClassList,
        ),
        Gap(height * 0.01),
        const LabelWithAsterisk(label: 'مدة الإ شتراك'),
        SubscriptionChipList(
          chips: packagesList,
          selectedChips: selectedPackagesList,
        ),
      ],
    );
  }
}
