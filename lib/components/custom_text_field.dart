import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextInputType type;
  final Widget? prefix;
  final Widget? suffix;
  final String hint;
  final Color? fillColor;
  final bool? enabled;
  final FocusNode? focusNode;
  final int? minLines;
  final TextDirection? textDirection;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final String? initialValue;
  final Function()? onTap;
  final double? height;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool showBorder;
  final BoxConstraints? prefixIconConstraints;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
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
    this.maxLines,
    this.onChange,
    this.controller,
    this.onFieldSubmitted,
    this.focusNode,
    this.textStyle,
    this.prefixIconConstraints,
    this.hintStyle,
    this.inputFormatters,
    this.textDirection,
    this.minLines,
    this.textAlign,
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
        focusNode: widget.focusNode,
        onFieldSubmitted: widget.onFieldSubmitted,
        maxLines: widget.type == TextInputType.visiblePassword ? 1 : widget.maxLines,
        minLines: widget.minLines,
        obscureText: widget.type == TextInputType.visiblePassword && !_visible,
        inputFormatters: widget.inputFormatters,
        textDirection: widget.textDirection ?? TextDirection.rtl,
        textAlign: widget.textAlign ?? TextAlign.start,
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
