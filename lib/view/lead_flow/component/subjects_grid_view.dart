import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/core/helpers/extensions.dart';

import '../controller/lead_flow_cubit.dart';
import '../model/ui_models.dart';
import '../widgets/grid_item_widget.dart';

class SubjectsGridView extends StatelessWidget {
  const SubjectsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadFlowCubit, LeadFlowState>(
      builder: (context, state) {
        final cubit = LeadFlowCubit.get(context);
        if (state is GetAllMaterialsLoading || cubit.materialsList == null) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
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
          itemCount: cubit.materialsList!.length,
          cacheExtent: 10,
          itemBuilder: (context, index) {
            return GridItemWidget(
              chip: cubit.materialsList![index],
              selectedChips: selectedMaterialsList,
            );
          },
        );
      },
    );
  }
}
