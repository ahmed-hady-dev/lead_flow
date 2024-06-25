import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_text_field.dart';
import '../../../core/helpers/picker_helper.dart';

class SelectDateTextFormField extends StatefulWidget {
  SelectDateTextFormField({
    super.key,
    required this.controller,
    required this.pickedDate,
    this.validator,
  });
  final TextEditingController controller;
  DateTime? pickedDate;
  final String? Function(String?)? validator;

  @override
  State<SelectDateTextFormField> createState() => _SelectDateTextFormFieldState();
}

class _SelectDateTextFormFieldState extends State<SelectDateTextFormField> {
  final year = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      suffix:
          const Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.calendar_today_outlined, color: Colors.grey)),
      type: TextInputType.datetime,
      hint: 'تاريخ الميلاد',
      validator: widget.validator,
      onTap: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        final date = await PickerHelper.pickDate();
        if (date != null) {
          setState(() {
            widget.pickedDate = date;
            widget.controller.text = DateFormat("dd/MM/yyyy").format(date);
          });
        }
      },
    );
  }
}
