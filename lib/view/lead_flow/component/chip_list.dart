import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class ChipList extends StatefulWidget {
  final List<dynamic> chips;
  final List<dynamic> selectedChips;
  final bool multiSelect;
  const ChipList({super.key, required this.chips, required this.selectedChips, this.multiSelect = true});

  @override
  _ChipListState createState() => _ChipListState();
}

class _ChipListState extends State<ChipList> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 2.0,
      children: widget.chips.map((chip) {
        return ChoiceChip.elevated(
          label: Text(chip),
          backgroundColor: Colors.white,
          elevation: 2.0,
          showCheckmark: false,
          side: BorderSide(color: widget.selectedChips.contains(chip) ? AppColors.primaryGreen : Colors.transparent),
          selectedColor: Colors.white,
          onSelected: (isSelected) {
            setState(() {
              if (widget.multiSelect) {
                if (isSelected) {
                  widget.selectedChips.add(chip);
                } else {
                  widget.selectedChips.remove(chip);
                }
              } else {
                widget.selectedChips.clear();
                if (isSelected) {
                  widget.selectedChips.add(chip);
                }
              }
            });
          },
          selected: widget.selectedChips.contains(chip),
        );
      }).toList(),
    );
  }
}
