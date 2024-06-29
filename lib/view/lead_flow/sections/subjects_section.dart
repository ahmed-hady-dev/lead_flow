import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';
import 'package:lead_flow/view/lead_flow/widgets/label_with_asterisk.dart';

import '../../../components/widget_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../../../core/helpers/extensions.dart';
import '../component/subjects_grid_view.dart';

class SubjectsSection extends StatelessWidget {
  const SubjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => await LeadFlowCubit.get(context).getAllMaterials(),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        children: [
          const WidgetWithVerticalDivider(
            text: 'حدد المواد التي ترغب في تسجيلها و سنوفر عليك الدعم اللازم لتحقيق أهدافك الأكاديمية.',
            dividerColor: AppColors.primaryGreen,
          ),
          Gap(height * 0.02),
          const LabelWithAsterisk(label: 'حدد المواد التي ترغب في دراستها'),
          const SubjectsGridView(),
          Gap(height * 0.01),
        ],
      ),
    );
  }
}
