import 'package:flutter/material.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';
import 'custom_drop_down_field.dart';

class NationalityDropDownField extends StatelessWidget {
  const NationalityDropDownField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LeadFlowCubit.get(context);
    return CustomDropDownTextField<String>(
      key: UniqueKey(),
      value: cubit.nationality,
      hint: 'الجنسية',
      items: const [
        DropdownMenuItem(
          value: 'Emirati',
          child: Text('إماراتي'),
        ),
        DropdownMenuItem(
          value: 'Saudi',
          child: Text("سعودي"),
        )
      ],
      onChanged: (value) {
        cubit.nationality = value;
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
