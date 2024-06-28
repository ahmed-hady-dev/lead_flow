import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lead_flow/view/lead_flow/controller/lead_flow_cubit.dart';
import '../../../components/custom_text_field.dart';
import '../../../core/helpers/picker_helper.dart';

class SelectDateTextFormField extends StatefulWidget {
  SelectDateTextFormField({
    super.key,
    required this.controller,
    this.validator,
    this.updateDate,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? updateDate;

  @override
  State<SelectDateTextFormField> createState() => _SelectDateTextFormFieldState();
}

class _SelectDateTextFormFieldState extends State<SelectDateTextFormField> {
  final year = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    final cubit = LeadFlowCubit.get(context);

    return CustomTextField(
      controller: widget.controller,
      suffix:
          const Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.calendar_today_outlined, color: Colors.grey)),
      type: TextInputType.datetime,
      hint: 'تاريخ الميلاد',
      validator: widget.validator,
      onTap: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        final date = await PickerHelper.pickDate(initialDate: cubit.pickedBirthDate);
        if (date != null) {
          cubit.pickedBirthDate = date;
          setState(() {
            widget.controller.text = DateFormat("dd/MM/yyyy").format(date);
          });
        }
      },
    );
  }
}
