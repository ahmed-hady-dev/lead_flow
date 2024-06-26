import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/view/lead_flow/component/subscription_chip_list.dart';
import 'package:lead_flow/view/lead_flow/model/package_model.dart';

import '../../../components/widget_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../component/chip_list.dart';
import '../widgets/label_with_asterisk.dart';

class PackageSection extends StatelessWidget {
  const PackageSection({Key? key}) : super(key: key);

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
          chips: [
            'حصة واحدة',
            'حصتين',
          ],
          selectedChips: [],
        ),
        Gap(height * 0.01),
        const LabelWithAsterisk(label: 'كم عدد ساعات الحصة الواحدة'),
        ChipList(
          chips: [
            'ساعة و نصف',
            'ساعتين',
            '30 دقيقة',
            'ساعة واحدة',
            'ساعتين و نصف',
          ],
          selectedChips: [],
        ),
        Gap(height * 0.01),
        const LabelWithAsterisk(label: 'مدة الإ شتراك'),
        SubscriptionChipList(
          chips: [
            PackageModel(
              name: 'ثلاثة فصول دراسية',
              duration: 'اثنا عشر شهراً',
              price: 800,
              discount: 15,
            ),
            PackageModel(
              name: 'فصليين دراسيين',
              duration: 'ستة أشهر',
              price: 650,
              discount: 10,
            ),
            PackageModel(
              name: 'فصل دراسي',
              duration: 'ثلاث أشهر',
              price: 450,
              discount: 10,
            ),
          ],
          selectedChips: [],
        ),
      ],
    );
  }
}
