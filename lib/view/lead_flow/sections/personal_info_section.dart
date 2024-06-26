import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/components/custom_text_field.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/view/lead_flow/component/difficulties_drop_down_field.dart';
import 'package:lead_flow/view/lead_flow/component/nationality_drop_down_field.dart';
import 'package:lead_flow/view/lead_flow/component/select_date_text_form_field.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';

import '../../../components/widget_with_vertical_divider.dart';
import '../../../constants/app_colors.dart';
import '../component/gender_drop_down_field.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = LeadFlowCubit.get(context);
    return Form(
      key: cubit.personalInfoFormKey,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        children: [
          const WidgetWithVerticalDivider(
            text:
                'نحن هنا لمساعدتك في رحلتك التعليميه إملأ بكل ثقة بيانات الإتصال الخاصة بك لنتمكن من توجيهك خطوة بخطوة',
            dividerColor: AppColors.primaryYellow,
          ),
          Gap(height * 0.02),
          SelectDateTextFormField(
            controller: cubit.birthDateController,
            pickedDate: cubit.pickedBirthDate,
            validator: (value) {
              if (value == null) {
                return 'يجب عليك تحديد تاريخ الميلاد';
              }
              return null;
            },
          ),
          Gap(height * 0.01),
          const GenderDropDownField(),
          Gap(height * 0.01),
          const NationalityDropDownField(),
          Gap(height * 0.01),
          const DifficultiesDropDownField(),
          Gap(height * 0.01),
          CustomTextField(
            lines: 3,
            controller: cubit.remarksController,
            hint: 'هل ترغب في تقديم أي ملاحظات إضافيه حول إحتياجاتك التعليمية أو الدعم الذي تحتاجه؟',
          )
        ],
      ),
    );
  }
}
