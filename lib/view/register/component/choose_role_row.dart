import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lead_flow/view/register/component/role_widget.dart';
import '../../../constants/app_colors.dart';
import '../../lead_flow/controller/lead_flow_cubit.dart';

class ChooseRoleRow extends StatelessWidget {
  const ChooseRoleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadFlowCubit, LeadFlowState>(
      builder: (context, state) {
        final cubit = LeadFlowCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoleWidget(
              data: 'طالب',
              condition: (cubit.isChosen == true && cubit.isStudent == true),
              color: AppColors.primaryYellow,
              icon: Icons.face,
              onTap: () {
                if (cubit.isChosen == null || cubit.isStudent == false) {
                  cubit.changeRole(isStudent: true);
                } else {
                  cubit.changeChosen();
                }
              },
            ),
            RoleWidget(
              data: 'ولي أمر',
              condition: (cubit.isChosen == true && cubit.isStudent == false),
              color: AppColors.primaryGreen,
              icon: Icons.escalator_warning,
              onTap: () {
                if (cubit.isChosen == null || cubit.isStudent == true) {
                  cubit.changeRole(isStudent: false);
                } else {
                  cubit.changeChosen();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
