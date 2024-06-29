import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/view/lead_flow/component/payment_form.dart';
import '../../../components/widget_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../component/terms_and_condition_row.dart';
import '../model/ui_models.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
      children: [
        const WidgetWithVerticalDivider(
          text:
              'إستعد للتعلم و التطور معنا و قم بالدفع بكل يسر وسهولة للبدء في رحلتك الرائعة نحو التعليم الممتع و المفيد',
          dividerColor: AppColors.primaryGreen,
        ),
        Padding(
          padding: EdgeInsets.only(top: height * 0.025),
          child: WidgetWithVerticalDivider(
            dividerColor: AppColors.primaryGreen,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              margin: const EdgeInsetsDirectional.only(end: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: AppColors.primaryGreen),
              ),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                  children: [
                    const TextSpan(text: 'الإجمالي: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '${double.tryParse(selectedSubscriptionList.first.price ?? '0')!.round()} درهم'),
                  ],
                ),
              ),
            ),
          ),
        ),
        Gap(height * 0.02),
        const PaymentForm(),
        Gap(height * 0.015),
        const TermsAndConditionRow(),
        Gap(height * 0.015),
      ],
    );
  }
}
