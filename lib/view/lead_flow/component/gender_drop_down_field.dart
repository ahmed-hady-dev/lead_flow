import 'package:flutter/material.dart';
import 'package:lead_flow/core/helpers/extensions.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';
import 'custom_drop_down_field.dart';

class GenderDropDownField extends StatelessWidget {
  const GenderDropDownField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LeadFlowCubit.get(context);
    return CustomDropDownTextField<String>(
      key: UniqueKey(),
      value: cubit.gender,
      hint: 'الجنس',
      items: const [
        DropdownMenuItem(
          value: 'Male',
          child: Text('ذكر'),
        ),
        DropdownMenuItem(
          value: 'Female',
          child: Text("أنثى"),
        )
      ],
      onChanged: (value) {
        cubit.gender = value!.capitalize;
        cubit.personalInfoFormKey.currentState!.save();
        cubit.emitState(state: UpdatePersonalInfoState());
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
    );
  }
}
