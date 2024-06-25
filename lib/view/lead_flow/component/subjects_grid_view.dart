import 'package:flutter/material.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

import '../model/grid_item.dart';
import '../widgets/grid_item_widget.dart';

final List<GridItem> items = [
  GridItem(text: 'الرياضيات', image: 'assets/images/math_icon.png'),
  GridItem(text: 'اللغة العربية', image: 'assets/images/arabic_icon.png'),
  GridItem(text: 'اللغة الألمانية', image: 'assets/images/germany_icon.png'),
  GridItem(text: 'اللغة الإنجليزية', image: 'assets/images/english_icon.png'),
  GridItem(text: 'علوم الحاسوب', image: 'assets/images/cs_icon.png'),
  GridItem(text: 'الكيمياء', image: 'assets/images/chemistry_icon.png'),
  GridItem(text: 'الأحياء', image: 'assets/images/biology_icon.png'),
  GridItem(text: 'الفيزياء', image: 'assets/images/physics_icon.png'),
  GridItem(text: 'اللغة الفرنسية', image: 'assets/images/french_icon.png'),
];
List<GridItem> selectedItems = [];

class SubjectsGridView extends StatelessWidget {
  const SubjectsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: height * 0.015, horizontal: width * 0.05),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: items.length,
      cacheExtent: 10,
      itemBuilder: (context, index) {
        return GridItemWidget(
          chip: items[index],
          selectedChips: selectedItems,
        );
      },
    );
  }
}
