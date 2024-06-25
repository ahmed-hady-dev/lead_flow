import 'package:flutter/material.dart';

class CustomDropDownTextField<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;
  final String? hint;
  final Color? fillColor;
  final Widget? prefix;
  final TextStyle? hintTextStyle;
  final String? Function(T?)? validator;
  final T? value;
  const CustomDropDownTextField({
    super.key,
    required this.items,
    required this.onChanged,
    this.hint,
    this.fillColor,
    this.prefix,
    this.hintTextStyle,
    this.validator,
    this.value,
  });

  @override
  State<CustomDropDownTextField<T>> createState() => _CustomDropDownTextFieldState<T>();
}

class _CustomDropDownTextFieldState<T> extends State<CustomDropDownTextField<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      isExpanded: true,
      value: widget.value,
      icon: const Icon(Icons.arrow_drop_down),
      items: widget.items,
      dropdownColor: Colors.white,
      hint: Text(widget.hint!, style: widget.hintTextStyle),
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: widget.prefix,
        hintText: widget.hint,
        fillColor: widget.fillColor ?? Colors.white,
      ),
    );
  }
}
