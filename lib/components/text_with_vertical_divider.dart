import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/constants/app_colors.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

class TextWithVerticalDivider extends StatefulWidget {
  const TextWithVerticalDivider({
    super.key,
    this.dividerColor = AppColors.primaryGreen,
    required this.text,
  });
  final Color dividerColor;
  final String text;
  @override
  State<TextWithVerticalDivider> createState() => _TextWithVerticalDividerState();
}

class _TextWithVerticalDividerState extends State<TextWithVerticalDivider> {
  final GlobalKey _key = GlobalKey();
  double textHeight = 72;
  void _getWidgetHeight() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
      setState(() {
        textHeight = renderBox.size.height;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getWidgetHeight());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: textHeight,
          width: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.dividerColor,
          ),
        ),
        Gap(widget.width * 0.03),
        Expanded(
          key: _key,
          child: Text(widget.text, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey)),
        ),
      ],
    );
  }
}
