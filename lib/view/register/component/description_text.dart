import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/constants/app_colors.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

class DescriptionText extends StatefulWidget {
  const DescriptionText({super.key});

  @override
  State<DescriptionText> createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  final GlobalKey _key = GlobalKey();
  double textHeight = 72;
  void _getWidgetHeight() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = _key.currentContext?.findRenderObject() as RenderBox;
      textHeight = renderBox.size.height;
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
      children: <Widget>[
        Container(
          height: textHeight,
          width: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryGreen,
          ),
        ),
        Gap(widget.width * 0.03),
        Expanded(
          key: _key,
          child: Text(
              'هل انت طالب تسعى لتوسيع افاقك و فتح أبواب المعرفه؟ أم ولي أمر تود متابعة رحلة ابنك التعليمية و دعمه في اكتشاف شغفه',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey)),
        ),
      ],
    );
  }
}
