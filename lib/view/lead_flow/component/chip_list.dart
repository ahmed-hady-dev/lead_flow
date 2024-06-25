import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class ChipList extends StatefulWidget {
  final List<String> chips;
  final List<String> selectedChips;

  const ChipList({super.key, required this.chips, required this.selectedChips});

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
              if (isSelected) {
                widget.selectedChips.add(chip);
              } else {
                widget.selectedChips.remove(chip);
              }
            });
          },
          selected: widget.selectedChips.contains(chip),
        );
      }).toList(),
    );
  }
}
