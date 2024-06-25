import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../model/grid_item.dart';

class GridItemWidget extends StatefulWidget {
  final GridItem chip;
  final List<GridItem> selectedChips;
  const GridItemWidget({super.key, required this.chip, required this.selectedChips});

  @override
  State<GridItemWidget> createState() => _GridItemWidgetState();
}

class _GridItemWidgetState extends State<GridItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip.elevated(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      label: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 4.0),
            Image.asset(widget.chip.image, width: 36, height: 36),
            const SizedBox(height: 8.0),
            Text(widget.chip.text),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
      onSelected: (isSelected) {
        setState(() {
          if (isSelected) {
            widget.selectedChips.add(widget.chip);
          } else {
            widget.selectedChips.remove(widget.chip);
          }
        });
      },
      checkmarkColor: Colors.red,
      selected: widget.selectedChips.contains(widget.chip),
      backgroundColor: Colors.white,
      elevation: 2.0,
      showCheckmark: false,
      side: BorderSide(color: widget.selectedChips.contains(widget.chip) ? AppColors.primaryGreen : Colors.transparent),
      selectedColor: Colors.white,
    );
  }
}
