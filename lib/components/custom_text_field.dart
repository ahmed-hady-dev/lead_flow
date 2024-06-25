import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType type;
  final Widget? prefix;
  final Widget? suffix;
  final String hint;
  final Color? fillColor;
  final bool? enabled;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final String? initialValue;
  final Function()? onTap;
  final double? height;
  final int? lines;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool showBorder;
  final BoxConstraints? prefixIconConstraints;
  const CustomTextField({
    super.key,
    this.type = TextInputType.text,
    this.prefix,
    required this.hint,
    this.suffix,
    this.fillColor,
    this.validator,
    this.initialValue,
    this.onTap,
    this.height,
    this.enabled = true,
    this.showBorder = true,
    this.lines,
    this.onChange,
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    this.textStyle,
    this.prefixIconConstraints,
    this.hintStyle,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _visible = false;
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        enabled: widget.enabled,
        controller: widget.controller,
        keyboardType: widget.type,
        readOnly: widget.onTap != null,
        initialValue: widget.initialValue,
        onTap: widget.onTap,
        validator: widget.validator,
        onChanged: widget.onChange,
        maxLines: widget.type == TextInputType.visiblePassword ? 1 : widget.lines,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: widget.focusNode,
        obscureText: widget.type == TextInputType.visiblePassword && !_visible,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: widget.hintStyle,
          prefixIcon: widget.prefix,
          prefixIconConstraints: widget.prefixIconConstraints,
          suffixIcon: widget.suffix ??
              (widget.type != TextInputType.visiblePassword
                  ? null
                  : GestureDetector(
                      onTap: () => setState(() => _visible = !_visible),
                      child: Icon(_visible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          color: _visible ? AppColors.primaryGreen : Colors.grey))),
        ),
      ),
    );
  }
}
