import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

import '../../../components/text_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../component/chip_list.dart';
import '../widgets/label_with_asterisk.dart';

class SubscribedStudentsSection extends StatelessWidget {
  const SubscribedStudentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      shrinkWrap: true,
      children: [
        const TextWithVerticalDivider(
          text: 'إملأ المعلومات الإضافية لتمكيننا من توفير تجربة دراسية مخصصة لإحتياجاتك الفردية',
          dividerColor: AppColors.primaryYellow,
        ),
        Gap(height * 0.02),
        const LabelWithAsterisk(label: 'ما عدد الطلاب المشتركين'),
        ChipList(
          chips: [
            'طابب واحد',
            'طالبين',
            'ثلاث طلاب',
            'أكثر من ذلك',
          ],
          selectedChips: [],
        ),
        Gap(height * 0.01),
        const LabelWithAsterisk(label: 'حدد أهدافك الدراسية'),
        ChipList(
          chips: [
            'تحضير لإختبار',
            'حل واجبات',
            'زيادة درجاتي',
            'أخرى',
          ],
          selectedChips: [],
        ),
      ],
    );
  }
}
