import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lead_flow/view/lead_flow/model/subscription_model.dart';

import '../../../constants/app_colors.dart';

class SubscriptionChipList extends StatefulWidget {
  final List<SubscriptionModel> chips;
  final List<SubscriptionModel> selectedChips;

  const SubscriptionChipList({super.key, required this.chips, required this.selectedChips});

  @override
  _SubscriptionChipListState createState() => _SubscriptionChipListState();
}

class _SubscriptionChipListState extends State<SubscriptionChipList> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: widget.chips.map((chip) {
        return FittedBox(
          child: ChoiceChip.elevated(
            label: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(4.0),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text('خصم ${chip.discount ?? '0'}%',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.redAccent)),
                  ),
                ),
                const Gap(8.0),
                Text(chip.termArabic ?? 'غير متوفر', style: const TextStyle()),
                const Gap(8.0),
                Text(
                  chip.periodArabic ?? 'غير متوفر',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.primaryGreen),
                ),
                const Gap(12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 16,
                      width: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryGreen,
                      ),
                    ),
                    Gap(4.0),
                    Text('${double.tryParse(chip.price ?? '0')!.round()} درهم',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.black)),
                  ],
                ),
              ],
            ),
            backgroundColor: Colors.white,
            elevation: 2.0,
            showCheckmark: false,
            side: BorderSide(color: widget.selectedChips.contains(chip) ? AppColors.primaryGreen : Colors.transparent),
            selectedColor: Colors.white,
            onSelected: (isSelected) {
              setState(() {
                widget.selectedChips.clear();
                if (isSelected) {
                  widget.selectedChips.add(chip);
                }
              });
            },
            selected: widget.selectedChips.contains(chip),
          ),
        );
      }).toList(),
    );
  }
}
