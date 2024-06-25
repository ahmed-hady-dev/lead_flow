import 'package:flutter/material.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';
import 'custom_drop_down_field.dart';

class DifficultiesDropDownField extends StatelessWidget {
  const DifficultiesDropDownField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = LeadFlowCubit.get(context);
    return CustomDropDownTextField<String>(
      key: UniqueKey(),
      value: cubit.difficulties,
      hint: 'هل تواجه أي صعوبات في الدراسة؟',
      items: const [
        DropdownMenuItem(
          value: 'Yes',
          child: Text('نعم لدي إعاقة'),
        ),
        DropdownMenuItem(
          value: 'No',
          child: Text("لا ليس لدي أي إعاقة"),
        )
      ],
      onChanged: (value) {
        cubit.difficulties = value;
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
