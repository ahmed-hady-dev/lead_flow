import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/view/lead_flow/widgets/label_with_asterisk.dart';

import '../../../components/text_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../../../core/helpers/extensions.dart';
import '../component/chip_list.dart';

class EducationalStageSection extends StatelessWidget {
  const EducationalStageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      shrinkWrap: true,
      children: [
        const TextWithVerticalDivider(
          text: 'اختر المرحلة الدراسية التي تناسبك و سنضمن لك افضل الخيارات التعليمية المتاحة.',
          dividerColor: AppColors.primaryYellow,
        ),
        Gap(height * 0.02),
        const LabelWithAsterisk(label: 'حدد المرحلة الدراسية'),
        ChipList(
          chips: [
            'رياض أطفال',
            'التعليم الإبتدائي',
            'التعليم المتوسط',
            'التعليم الثانوي',
          ],
          selectedChips: [],
        ),
        Gap(height * 0.01),
        const LabelWithAsterisk(label: 'حدد صفك الدراسي'),
        ChipList(
          chips: [
            'الصف الخامس',
            'الصف السادس',
            'الصف السابع',
            'الصف الثامن',
          ],
          selectedChips: [],
        ),
        Gap(height * 0.01),
        const LabelWithAsterisk(label: 'حدد المنهج الدراسي'),
        ChipList(
          chips: [
            'المنهج البريطاني',
            'المنهج الأمريكي',
            'المنهج الموازي',
            'أخرى',
          ],
          selectedChips: [],
        )
      ],
    );
  }
}
