import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../model/material_model.dart';

class GridItemWidget extends StatefulWidget {
  final MaterialModel chip;
  final List<MaterialModel> selectedChips;
  const GridItemWidget({super.key, required this.chip, required this.selectedChips});

  @override
  State<GridItemWidget> createState() => _GridItemWidgetState();
}

class _GridItemWidgetState extends State<GridItemWidget> {
  String getItemImage({required String arabicData}) {
    String image = 'assets/images/more_icon.png';
    switch (arabicData) {
      case 'اللغة الفرنسية':
        image = 'assets/images/french_icon.png';
        break;
      case 'الكيمياء':
        image = 'assets/images/chemistry_icon.png';
        break;
      case 'علوم الحاسب':
        image = 'assets/images/cs_icon.png';
        break;
      case 'الفيزياء':
        image = 'assets/images/physics_icon.png';
        break;
      case 'الاحياء':
        image = 'assets/images/biology_icon.png';
        break;
      case 'اللغة العربية':
        image = 'assets/images/arabic_icon.png';
        break;
      case 'الرياضيات':
        image = 'assets/images/math_icon.png';
        break;
      case 'اللغة الانجليزية':
        image = 'assets/images/english_icon.png';
        break;
      case 'اللغة الالمانية':
        image = 'assets/images/germany_icon.png';
        break;

      default:
        image = 'assets/images/more_icon.png';
    }
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip.elevated(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      label: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 4.0),
            Image.asset(getItemImage(arabicData: widget.chip.arabicData!), width: 36, height: 36),
            const SizedBox(height: 8.0),
            Text(widget.chip.arabicData ?? ''),
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
