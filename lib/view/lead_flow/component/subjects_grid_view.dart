import 'package:flutter/material.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

import '../model/ui_models.dart';
import '../widgets/grid_item_widget.dart';

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
      itemCount: subjectsList.length,
      cacheExtent: 10,
      itemBuilder: (context, index) {
        return GridItemWidget(
          chip: subjectsList[index],
          selectedChips: selectedSubjectsList,
        );
      },
    );
  }
}
