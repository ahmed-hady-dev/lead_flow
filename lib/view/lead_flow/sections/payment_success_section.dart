import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

import '../../../components/widget_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../component/animated_tick_icon.dart';
import '../component/success_text.dart';

class PaymentSuccessSection extends StatelessWidget {
  const PaymentSuccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      children: [
        const WidgetWithVerticalDivider(
          text: 'شكراً لثقتك بنا نحن في إنتظارك لنبدأ معاً رحلة تعلم ملهمه و مثمرة.',
          dividerColor: AppColors.primaryYellow,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.05),
          child: Column(
            children: <Widget>[
              const AnimatedTickIcon(),
              Gap(height * 0.025),
              const SuccessText(),
            ],
          ),
        ),
      ],
    );
  }
}
