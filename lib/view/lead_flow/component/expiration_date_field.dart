import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpirationDateField extends StatefulWidget {
  const ExpirationDateField({super.key, required this.controller, this.focusNode, this.onFieldSubmitted});
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  @override
  _ExpirationDateFieldState createState() => _ExpirationDateFieldState();
}

class _ExpirationDateFieldState extends State<ExpirationDateField> {
  String? _validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'الرجاء إدخال تاريخ انتهاء الصلاحية';
    }
    final date = DateFormat('MM/yy').parse(value, true);
    if (date.isBefore(DateTime.now())) {
      return 'لا يمكن أن يكون تاريخ انتهاء الصلاحية في الماضي';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      validator: _validateDate,
      keyboardType: TextInputType.datetime,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: const InputDecoration(
        alignLabelWithHint: true,
        hintText: 'تاريخ إنتهاء الصلاحية',
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(4),
        ExpirationDateFormatter(),
      ],
    );
  }
}

class ExpirationDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;

    String newText;
    if (newTextLength == 0) {
      newText = '';
    } else if (newTextLength <= 2) {
      newText = newValue.text;
    } else if (newTextLength <= 4) {
      newText = '${newValue.text.substring(0, 2)}/${newValue.text.substring(2)}';
      selectionIndex += 1;
    } else {
      newText = oldValue.text;
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
